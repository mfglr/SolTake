using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.SolutionUserSaveAggregate.Abstracts;
using SolTake.Domain.SolutionUserSaveAggregate.DomainServices;
using SolTake.Domain.SolutionUserSaveAggregate.Entities;

namespace SolTake.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.CreateSolutionUserSave
{
    public class CreateSolutionUserSaveHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, ISolutionUserSaveWriteRepository solutionUserSaveWriteRepository,SolutionUserSaveCreatorDomainService solutionUserSaveCreatorDomainService) : IRequestHandler<CreateSolutionUserSaveDto, CreateSolutionUserSaveResponseDto>
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
