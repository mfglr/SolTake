using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Application.InfrastructureServices.BlobService.Objects;
using SolTake.Core;
using SolTake.Domain.ExamAggregate.Abstracts;
using SolTake.Domain.ExamAggregate.Exceptions;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.QuestionAggregate.Entities;
using SolTake.Domain.QuestionAggregate.Exceptions;
using SolTake.Domain.QuestionAggregate.ValueObjects;
using SolTake.Domain.SubjectAggregate.Abstracts;
using SolTake.Domain.SubjectAggregate.Exceptions;
using SolTake.Domain.SubjectTopicAggregate.Abstracts;
using SolTake.Domain.TopicAggregate.Abstracts;
using SolTake.Domain.TopicAggregate.Entities;

namespace SolTake.Application.Commands.QuestionDomain.QuestionAggregate.CreateQuestion
{
    public class CreateQuestionHandler(IUnitOfWork unitOfWork, IQuestionWriteRepository repository, IBlobService blobService, IMultimediaService multimedyaService, IExamReadRepository examReadRepository, ISubjectReadRepository subjectReadRepository, ITopicReadRepository topicReadRepository, ISubjectTopicReadRepository subjectTopicReadRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<CreateQuestionDto, CreateQuestionResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IQuestionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;
        private readonly IMultimediaService _multimedyaService = multimedyaService;
        private readonly IExamReadRepository _examReadRepository = examReadRepository;
        private readonly ISubjectReadRepository _subjectReadRepository = subjectReadRepository;
        private readonly ITopicReadRepository _topicReadRepository = topicReadRepository;
        private readonly ISubjectTopicReadRepository _subjectTopicReadRepository = subjectTopicReadRepository;

        public async Task<CreateQuestionResponseDto> Handle(CreateQuestionDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();

            var exam =
               await _examReadRepository.GetByIdAsync(request.ExamId, cancellationToken) ??
               throw new ExamNotFoundException();

            var subject =
                await _subjectReadRepository.GetByIdAsync(request.SubjectId, cancellationToken) ??
                throw new SubjectNotFoundException();

            if (request.ExamId != subject.ExamId)
                throw new SubjectIsNotIncludedInExamException();

            Topic? topic = null;

            if (request.TopicId != null)
            {
                topic = await _topicReadRepository.GetTopicById((int)request.TopicId, cancellationToken);
                if (topic == null)
                    throw new TopicNotFoundException();

                if (!await _subjectTopicReadRepository.ExistAsync(request.SubjectId, (int)request.TopicId, cancellationToken))
                    throw new TopicIsNotIncludedInSubjectException();
            }

            IEnumerable<Multimedia> questionMedias = [];
            try
            {
                //upload question images
                questionMedias = await _multimedyaService.UploadAsync(ContainerName.QuestionMedias, request.Medias, cancellationToken);

                //create question
                var questionExam = new QuestionExam(exam.Id, exam.Initialism.Value, exam.Name.Value);
                var questionSubject = new QuestionSubject(subject.Id, subject.Name);
                var questionTopic = topic != null ? new QuestionTopic(topic.Id, topic.Name) : null;
                var content = request.Content != null ? new QuestionContent(request.Content) : null;
                var question = new Question(userId,questionExam,questionSubject,questionTopic, content, questionMedias);
                question.Create();
                await _repository.CreateAsync(question, cancellationToken);

                //commit changes
                await _unitOfWork.CommitAsync(cancellationToken);

                return new(question.Id);
            }
            catch (Exception)
            {
                foreach (var media in questionMedias)
                    await _blobService.DeleteAsync(ContainerName.QuestionMedias, media.BlobName, cancellationToken);
                throw;
            }

        }
    }
}
