using MassTransit;
using SolTake.Core.Events;
using SolTake.QuestionService.Domain.Abstracts;
using SolTake.QuestionService.Domain.Entities;
using SolTake.QuestionService.Domain.ValueObjects;

namespace SolTake.QuestionService.Application.ApplicationServices.Create
{
    internal class CreateQuestionHandler(IPublishEndpoint publishEndpoint, IQuestionRepository questionRepository, IBlobService blobService, MediaTypeMapper mediaTypeMapper, MediaGenerator mediaGenerator) : IConsumer<CreateQuestionDto>
    {
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;
        private readonly IQuestionRepository _questionRepository = questionRepository;
        private readonly IBlobService _blobService = blobService;
        private readonly MediaTypeMapper _mediaTypeMapper = mediaTypeMapper;
        private readonly MediaGenerator _mediaGenerator = mediaGenerator;

        public async Task Consume(ConsumeContext<CreateQuestionDto> context)
        {
            List<string> blobNames = [];
            try
            {
                var types = _mediaTypeMapper.GetTypes(context.Message.Media);
                blobNames = await _blobService.UploadAsync("QuestionMedia", context.Message.Media, context.CancellationToken);
                var media = _mediaGenerator.Generate("QuestionMedia", types, blobNames);

                var userId = 1;
                var content = context.Message.Content != null ? new QuestionContent(context.Message.Content) : null;
                var topics = context.Message.Topics.Select(x => new QuestionTopic(x));
                var question = new Question(userId, content, context.Message.ExamId, context.Message.SubjectId, topics, media);
                question.Create();

                await _questionRepository.CreateAsync(question, context.CancellationToken);

                foreach (var mediaItem in media)
                    await _publishEndpoint.Publish(
                        new MediaUploadedEvent(question.Id, mediaItem.ContainerName, mediaItem.BlobName, mediaItem.Type),
                        context.CancellationToken
                    );
            }
            catch (Exception)
            {
                if (blobNames.Count != 0)
                    await _blobService.DeleteAsync("QuestionMedia", blobNames, context.CancellationToken);
                throw;
            }
        }
    }
}
