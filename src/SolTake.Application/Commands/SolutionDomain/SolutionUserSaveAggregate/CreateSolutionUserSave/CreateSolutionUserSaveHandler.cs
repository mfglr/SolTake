using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.SolutionUserSaveAggregate.Abstracts;
using MySocailApp.Domain.SolutionUserSaveAggregate.DomainServices;
using MySocailApp.Domain.SolutionUserSaveAggregate.Entities;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.CreateSolutionUserSave
{
    public class CreateSolutionUserSaveHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, ISolutionUserSaveWriteRepository solutionUserSaveWriteRepository, ISolutionUserSaveReadRepository solutionUserSaveReadRepository, SolutionUserSaveCreatorDomainService solutionUserSaveCreatorDomainService) : IRequestHandler<CreateSolutionUserSaveDto, CreateSolutionUserSaveResponseDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly ISolutionUserSaveWriteRepository _solutionUserSaveWriteRepository = solutionUserSaveWriteRepository;
        private readonly SolutionUserSaveCreatorDomainService _solutionUserSaveCreatorDomainService = solutionUserSaveCreatorDomainService;

        public async Task<CreateSolutionUserSaveResponseDto> Handle(CreateSolutionUserSaveDto request, CancellationToken cancellationToken)
        {
            var save = new SolutionUserSave(request.SolutionId, _userAccessor.User.Id);
            await _solutionUserSaveCreatorDomainService.CreateAsync(save, cancellationToken);
            await _solutionUserSaveWriteRepository.CreateAsync(save, cancellationToken);
            
            await _unitOfWork.CommitAsync(cancellationToken);

            return new(save.Id);
        }
    }
}
