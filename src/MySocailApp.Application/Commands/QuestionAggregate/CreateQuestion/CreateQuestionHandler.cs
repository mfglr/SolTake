using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionAggregate.DomainServices;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion
{
    public class CreateQuestionHandler(IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IQuestionWriteRepository repository, IQuestionQueryRepository questionQueryRepository, QuestionCreatorDomainService questionCreator, IBlobService blobService, IMultimedyaService multimedyaService) : IRequestHandler<CreateQuestionDto, QuestionResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly QuestionCreatorDomainService _questionCreator = questionCreator;
        private readonly IQuestionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;
        private readonly IBlobService _blobService = blobService;
        private readonly IMultimedyaService _multimedyaService = multimedyaService;

        public async Task<QuestionResponseDto> Handle(CreateQuestionDto request, CancellationToken cancellationToken)
        {
            IEnumerable<QuestionMultimedia> questionMedias = [];
            try
            {
                //upload question images
                questionMedias = (await _multimedyaService.UploadAsync(ContainerName.QuestionMedias, request.Medias, cancellationToken)).Select(x => new QuestionMultimedia(x));

                //create question
                var userId = _accessTokenReader.GetRequiredAccountId();
                var content = new QuestionContent(request.Content ?? "");
                var question = new Question(userId, content, questionMedias);
                await _questionCreator.CreateAsync(question, request.ExamId, request.SubjectId, request.TopicId, cancellationToken);
                await _repository.CreateAsync(question, cancellationToken);

                //commit changes
                await _unitOfWork.CommitAsync(cancellationToken);

                return (await _questionQueryRepository.GetQuestionByIdAsync(question.Id, userId, cancellationToken))!;
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
