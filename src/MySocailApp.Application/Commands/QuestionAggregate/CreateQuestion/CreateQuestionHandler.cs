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
    public class CreateQuestionHandler(IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IQuestionWriteRepository repository, IQuestionQueryRepository questionQueryRepository, QuestionCreatorDomainService questionCreator, IImageService imageService, IBlobService blobService) : IRequestHandler<CreateQuestionDto, QuestionResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly QuestionCreatorDomainService _questionCreator = questionCreator;
        private readonly IQuestionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;
        private readonly IImageService _imageService = imageService;
        private readonly IBlobService _blobService = blobService;

        public async Task<QuestionResponseDto> Handle(CreateQuestionDto request, CancellationToken cancellationToken)
        {
            List<AppImage> appImages = [];
            try
            {
                //upload question images
                appImages = await _imageService.UploadAsync(ContainerName.QuestionImages, request.Images, cancellationToken);

                //create question
                var questionImages = appImages.Select(x => QuestionImage.Create(x.BlobName, x.Dimention.Height, x.Dimention.Width));
                var userId = _accessTokenReader.GetRequiredAccountId();
                var content = new QuestionContent(request.Content ?? "");
                var question = new Question(userId, content, questionImages);
                await _questionCreator.CreateAsync(question, request.ExamId, request.SubjectId, request.TopicId, cancellationToken);
                await _repository.CreateAsync(question, cancellationToken);

                //commit changes
                await _unitOfWork.CommitAsync(cancellationToken);

                return (await _questionQueryRepository.GetQuestionByIdAsync(question.Id, userId, cancellationToken))!;
            }
            catch (Exception)
            {
                foreach (var appImage in appImages)
                    await _blobService.DeleteAsync(appImage.ContainerName, appImage.BlobName, cancellationToken);
                throw;
            }

        }
    }
}
