using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.Unblock
{
    public class UnblockHandler(IUserAccessor accountAccessor, IUnitOfWork unitOfWork, IUserWriteRepository userWriteRepository) : IRequestHandler<UnblockDto>
    {
        private readonly IUserAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;

        public async Task Handle(UnblockDto request, CancellationToken cancellationToken)
        {
            var blocked =
                await _userWriteRepository.GetByIdAsync(request.BlockedId, cancellationToken) ??
                throw new UserNotFoundException();
            blocked.Unblock(_accountAccessor.User.Id);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
