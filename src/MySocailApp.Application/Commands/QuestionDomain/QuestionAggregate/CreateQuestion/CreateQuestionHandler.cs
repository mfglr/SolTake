using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.DomainServices;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.CreateQuestion
{
    public class CreateQuestionHandler(IUnitOfWork unitOfWork, IQuestionWriteRepository repository, QuestionCreatorDomainService questionCreator, IBlobService blobService, IMultimediaService multimedyaService, IUserAccessor userAccessor) : IRequestHandler<CreateQuestionDto, CreateQuestionResponseDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly QuestionCreatorDomainService _questionCreator = questionCreator;
        private readonly IQuestionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;
        private readonly IMultimediaService _multimedyaService = multimedyaService;

        public async Task<CreateQuestionResponseDto> Handle(CreateQuestionDto request, CancellationToken cancellationToken)
        {
            IEnumerable<QuestionMultimedia> questionMedias = [];
            try
            {
                //upload question images
                questionMedias = (await _multimedyaService.UploadAsync(ContainerName.QuestionMedias, request.Medias, cancellationToken)).Select(x => new QuestionMultimedia(x));

                //create question
                var content = request.Content != null ? new QuestionContent(request.Content) : null;
                var question = new Question(_userAccessor.User.Id, content, questionMedias);
                await _questionCreator.CreateAsync(question, request.ExamId, request.SubjectId, request.TopicId, cancellationToken);
                await _repository.CreateAsync(question, cancellationToken);

                //commit changes
                await _unitOfWork.CommitAsync(cancellationToken);

                return new(question, _userAccessor.User);
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
