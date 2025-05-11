using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.DomainServices;
using MySocailApp.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.RemoveOldSecurityStamps
{
    public class RemoveOldSecurityStampsHandler(IUserWriteRepository userWriteRepository, SecurityStampsRemover securityStampsRemover, IUnitOfWork unitOfWork) : IRequestHandler<RemoveOldSecurityStampsDto>
    {
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly SecurityStampsRemover _securityStampsRemover = securityStampsRemover;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(RemoveOldSecurityStampsDto request, CancellationToken cancellationToken)
        {
            var user =
                await _userWriteRepository.GetByIdAsync(request.Id, cancellationToken) ??
                throw new UserNotFoundException();
            await _securityStampsRemover.RemoveAsync(user, request.RefreshToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
