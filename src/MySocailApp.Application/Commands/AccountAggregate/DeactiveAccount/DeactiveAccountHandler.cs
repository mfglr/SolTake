using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.DeactiveAccount
{
    public class DeactiveAccountHandler(IAppUserRepository userRepository, IUnitOfWork unitOfWork, IAccountAccessor accountAccessor) : IRequestHandler<DeactiveAccountDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IAppUserRepository _userRepository = userRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DeactiveAccountDto request, CancellationToken cancellationToken)
        {
            var account = _accountAccessor.Account;
            account.Remove();
            var user = (await _userRepository.GetWithAllAsync(account.Id, cancellationToken))!;
            user.Remove();

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
