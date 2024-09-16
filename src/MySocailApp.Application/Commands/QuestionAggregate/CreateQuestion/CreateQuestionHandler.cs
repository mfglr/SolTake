using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.QuestionAggregate.DomainServices;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion
{
    public class CreateQuestionHandler(IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IQuestionWriteRepository repository, IQuestionQueryRepository questionQueryRepository, QuestionCreatorDomainService questionCreator, IBlobService blobService) : IRequestHandler<CreateQuestionDto, QuestionResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly QuestionCreatorDomainService _questionCreator = questionCreator;
        private readonly IQuestionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;
        private readonly IBlobService _blobService = blobService;

        public async Task<QuestionResponseDto> Handle(CreateQuestionDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();

            var images = (await _blobService.UploadAsync(ContainerName.QuestionImages, request.Images, cancellationToken)).Select(x => QuestionImage.Create(x.BlobName, x.Dimention.Height,x.Dimention.Width));
            
            var question = new Question();
            var content = new QuestionContent(request.Content ?? "");
            await _questionCreator.CreateAsync(question, accountId, content, request.ExamId, request.SubjectId, request.TopicIds, images,cancellationToken);
            await _repository.CreateAsync(question, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return (await _questionQueryRepository.GetQuestionByIdAsync(question.Id,accountId,cancellationToken))!;
        }
    }
}
