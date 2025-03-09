using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Exceptions;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.UnsaveSolution
{
    public class DeleteSolutionUserSaveHandler(IUnitOfWork unitOfWork, ISolutionUserSaveWriteRepository solutionUserSaveWriteRepository, IUserAccessor userAccessor) : IRequestHandler<DeleteSolutionUserSaveDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly ISolutionUserSaveWriteRepository _solutionUserSaveWriteRepository = solutionUserSaveWriteRepository;
        
        public async Task Handle(DeleteSolutionUserSaveDto request, CancellationToken cancellationToken)
        {
            var save = 
                await _solutionUserSaveWriteRepository.GetAsync(request.SolutionId,_userAccessor.User.Id,cancellationToken) ??
                throw new SolutionNotSavedException();
            _solutionUserSaveWriteRepository.Delete(save);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
