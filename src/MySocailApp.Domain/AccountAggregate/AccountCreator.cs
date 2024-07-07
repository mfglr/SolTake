using Microsoft.AspNetCore.Identity;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AppUserAggregate;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate
{
    public class AccountCreator(IAppUserRepository userRepository, ITransactionCreator transactionCreator, UserManager<Account> userManager)
    {
        private readonly IAppUserRepository _userRepository = userRepository;
        private readonly ITransactionCreator _transactionCreator = transactionCreator;
        private readonly UserManager<Account> _userManager = userManager;

        public async Task CreateAsync(Account account,string email,string password,CancellationToken cancellationToken)
        {
            var transaction = await _transactionCreator.CreateTransactionAsync(cancellationToken);
            
            //create account
            account.Create(email);
            var result = await _userManager.CreateAsync(account, password);
            if (!result.Succeeded)
                throw new ClientSideException(result.Errors.Select(x => x.Description).ToList(), (int)HttpStatusCode.BadRequest);

            //create user
            var user = new AppUser(account.Id, account.UserName!);
            user.Create();
            await _userRepository.CreateAsync(user, cancellationToken);

            //add role to account
            await _userManager.AddToRoleAsync(account, Roles.USER);

            await transaction.CommitAsync(cancellationToken);
        }
    }
}
