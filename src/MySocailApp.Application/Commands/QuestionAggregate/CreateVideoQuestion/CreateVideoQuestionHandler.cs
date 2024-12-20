using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionAggregate.DomainServices;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateVideoQuestion
{
    public class CreateVideoQuestionHandler(IUnitOfWork unitOfWork, IBlobService blobService, IMultimedyaService multimediaService, IQuestionWriteRepository questionWriteRepository, QuestionCreatorDomainService questionCreatorDomainService, IAccountAccessor accountAccessor) : IRequestHandler<CreateVideoQuestionDto, CreateVideoQuestionResponseDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IBlobService _blobService = blobService;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IMultimedyaService _multimediaService = multimediaService;
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly QuestionCreatorDomainService _questionCreatorDomainService = questionCreatorDomainService;

        public async Task<CreateVideoQuestionResponseDto> Handle(CreateVideoQuestionDto request, CancellationToken cancellationToken)
        {
            Multimedia? media = null;
            try
            {
                media = await _multimediaService.UploadAsync(ContainerName.QuestionMedias, request.Video, cancellationToken);
                
                var content = request.Content != null ? new QuestionContent(request.Content) : null;
                var video = media != null ? new QuestionMultimedia(media) : null;

                var question = new Question(_accountAccessor.Account.Id, content, video);
                await _questionCreatorDomainService.CreateAsync(question, request.ExamId, request.SubjectId, request.TopicId, cancellationToken);
                await _questionWriteRepository.CreateAsync(question, cancellationToken);
                
                await _unitOfWork.CommitAsync(cancellationToken);

                return new CreateVideoQuestionResponseDto(question,_accountAccessor.Account);

            }
            catch (Exception)
            {
                if (media != null)
                    await _blobService.DeleteAsync(ContainerName.QuestionMedias, media.BlobName, cancellationToken);
                throw;
            }
        }
    }
}
