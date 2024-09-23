using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class AccountRemoverDomainService(IAppUserWriteRepository userWriteRepository)
    {
        private readonly IAppUserWriteRepository _userWriteRepository = userWriteRepository;

        public async Task RemoveAsync(Account account,CancellationToken cancellationToken)
        {
            var user =
                await _userWriteRepository.GetByIdAsync(account.Id, cancellationToken) ??
                throw new UserNotFoundException();
            account.Remove();
            user.Remove();
        }
    }
}
