using Microsoft.AspNetCore.Identity;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using MySocailApp.Domain.AccountAggregate.ValueObjects;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.Shared;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class AccountManager(IAppUserRepository userRepository, ITransactionCreator transactionCreator, UserManager<Account> userManager, ITokenService tokenService)
    {
        private readonly IAppUserRepository _userRepository = userRepository;
        private readonly ITransactionCreator _transactionCreator = transactionCreator;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenService _tokenService = tokenService;

        public async Task CreateAsync(Account account, string email, string password, CancellationToken cancellationToken)
        {
            var transaction = await _transactionCreator.CreateTransactionAsync(cancellationToken);

            //create account
            account.Create(email);
            var result = await _userManager.CreateAsync(account, password);
            if (!result.Succeeded)
                throw new ClientSideException(result.Errors.Select(x => x.Description).ToList(), (int)HttpStatusCode.BadRequest);

            //create user
            var user = new AppUser(account.Id);
            user.Create();
            await _userRepository.CreateAsync(user, cancellationToken);

            //add role to account
            await _userManager.AddToRoleAsync(account, Roles.USER);

            await transaction.CommitAsync(cancellationToken);

            //update token
            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task UpdateEmailAsync(Account account, string email)
        {
            //update email of account
            account.UpdateEmail(email);
            var result = await _userManager.UpdateAsync(account);
            if (!result.Succeeded)
                throw new ClientSideException(result.Errors.Select(x => x.Description).ToList(), (int)HttpStatusCode.BadRequest);

            //update token
            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task UpdateUserNameAsync(Account account, string userName)
        {
            //update user name of account
            account.UpdateUserName(userName);
            var result = await _userManager.UpdateAsync(account);
            if (!result.Succeeded)
                throw new ClientSideException(result.Errors.Select(x => x.Description).ToList(), (int)HttpStatusCode.BadRequest);
            //update token
            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task UpdatePasswordAsync(Account account, string currentPasword, string newPassword)
        {
            //chenck password
            if (!await _userManager.CheckPasswordAsync(account, currentPasword))
                throw new IncorrectPasswordException();

            //update password;
            var result = await _userManager.ChangePasswordAsync(account, currentPasword, newPassword);
            if (!result.Succeeded)
                throw new ServerSideException(result.Errors.Select(x => x.Description).ToList());

            //update token
            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task ConfirmEmailByToken(Account account, string token)
        {
            //confirmEmail
            account.ConfirmEmailByToken(token);
            await _userManager.UpdateAsync(account);
            //update token
            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task LoginByPassword(Account account, string password, CancellationToken cancellationToken)
        {
            if (!await _userManager.CheckPasswordAsync(account, password))
                throw new LoginFailedException();

            if (account.IsRemoved)
            {
                account.Restore();
                var user = await _userRepository.GetWithAllAsync(account.Id, cancellationToken);
                user.Restore();
            }

            //update security stamp to revoke previous refresh token.
            var result = await _userManager.UpdateSecurityStampAsync(account);
            if (!result.Succeeded)
                throw new ServerSideException(result.Errors.Select(x => x.Description).ToList());

            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task LoginByRefreshToken(Account account, string refrehToken)
        {
            if (!await _tokenService.VerifyRefreshToken(account, refrehToken))
                throw new InvalidRefreshTokenException();
            //update security stamp to revoke previous refresh token.
            var result = await _userManager.UpdateSecurityStampAsync(account);
            if (!result.Succeeded)
                throw new ServerSideException(result.Errors.Select(x => x.Description).ToList());

            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task LogOutAsync(Account account)
        {
            //update security stamp to revoke previous refresh token.
            var result = await _userManager.UpdateSecurityStampAsync(account);
            if (!result.Succeeded)
                throw new ServerSideException(result.Errors.Select(x => x.Description).ToList());
        }
    }
}
