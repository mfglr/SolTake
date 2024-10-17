using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService.ImageServices;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.QuestionAggregate.DomainServices;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion
{
    public class CreateQuestionHandler(IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IQuestionWriteRepository repository, IQuestionQueryRepository questionQueryRepository, QuestionCreatorDomainService questionCreator, IImageService blobService) : IRequestHandler<CreateQuestionDto, QuestionResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly QuestionCreatorDomainService _questionCreator = questionCreator;
        private readonly IQuestionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;
        private readonly IImageService _blobService = blobService;

        public async Task<QuestionResponseDto> Handle(CreateQuestionDto request, CancellationToken cancellationToken)
        {
            //upload question images
            var images = (await _blobService.UploadAsync(ContainerName.QuestionImages, request.Images, cancellationToken)).Select(x => QuestionImage.Create(x.BlobName, x.Dimention.Height, x.Dimention.Width));

            var userId = _accessTokenReader.GetRequiredAccountId();
            var content = new QuestionContent(request.Content ?? "");

            var question = new Question(userId,content,images);
            await _questionCreator.CreateAsync(question, request.ExamId, request.SubjectId, request.TopicId, cancellationToken);
            
            await _repository.CreateAsync(question, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return (await _questionQueryRepository.GetQuestionByIdAsync(question.Id, userId, cancellationToken))!;
        }
    }
}
