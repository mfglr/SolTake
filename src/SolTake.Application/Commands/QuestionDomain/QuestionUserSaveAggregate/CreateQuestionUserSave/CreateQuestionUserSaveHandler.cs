using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Abstracts;
using SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Entities;
using SolTake.Domain.QuestionUserSaveAggregate.DomainServices;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserSaveAggregate.CreateQuestionUserSave
{
    public class CreateQuestionUserSaveHandler(IUnitOfWork unitOfWork, IQuestionUserSaveWriteRepository questionUserSaveWriteRepository, IUserAccessor userAccessor, QuestionUserSaveCreatorDomainService questionUserSaveCreatorDomainService) : IRequestHandler<CreateQuestionUserSaveDto, CreateQuestionUserSaveResponseDto>
    {
        private readonly IQuestionUserSaveWriteRepository _questionUserSaveWriteRepository = questionUserSaveWriteRepository;
        private readonly QuestionUserSaveCreatorDomainService _questionUserSaveCreatorDomainService = questionUserSaveCreatorDomainService;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<CreateQuestionUserSaveResponseDto> Handle(CreateQuestionUserSaveDto request, CancellationToken cancellationToken)
        {
            var save = new QuestionUserSave(request.QuestionId, _userAccessor.User.Id);
            await _questionUserSaveCreatorDomainService.CreateAsync(save, cancellationToken);
            await _questionUserSaveWriteRepository.CreateAsync(save, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);
            return new(save.Id);
        }
    }
}
