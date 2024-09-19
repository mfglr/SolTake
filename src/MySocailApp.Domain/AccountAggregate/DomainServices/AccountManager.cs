using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using MySocailApp.Domain.AccountAggregate.ValueObjects;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class AccountManager(IAppUserWriteRepository userWriteRepository, ITransactionCreator transactionCreator, UserManager<Account> userManager, ITokenService tokenService)
    {
        private readonly IAppUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly ITransactionCreator _transactionCreator = transactionCreator;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenService _tokenService = tokenService;

        public async Task CreateAsync(Account account, string email, string password, string passwordConfirm, CancellationToken cancellationToken)
        {
            if (password == null)
                throw new PasswordIsRequiredException();
            if (password.Length < 6)
                throw new PasswordTooShortException();
            if (password != passwordConfirm)
                throw new PassowordAndPasswordConfirmationNotMatchException();
            
            if (await _userManager.Users.AnyAsync(x => x.Email == email, cancellationToken))
                throw new EmailIsAlreadyTakenException();

            var transaction = await _transactionCreator.CreateTransactionAsync(cancellationToken);

            //create account
            account.CreateByEmail(email);
            var result = await _userManager.CreateAsync(account, password);
            if (!result.Succeeded) throw new ServerSideException();

            //create user
            var user = new AppUser(account.Id);
            user.Create();
            await _userWriteRepository.CreateAsync(user, cancellationToken);

            //add role to account
            result = await _userManager.AddToRoleAsync(account, Roles.USER);
            if (!result.Succeeded) throw new ServerSideException();

            await transaction.CommitAsync(cancellationToken);

            //update token
            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task UpdateEmailAsync(Account account, string email)
        {
            if (await _userManager.FindByEmailAsync(email) != null)
                throw new EmailIsAlreadyTakenException();

            //update email of account
            account.UpdateEmail(email);
            var result = await _userManager.UpdateAsync(account);
            if (!result.Succeeded) throw new ServerSideException();

            //update token
            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task UpdateUserNameAsync(Account account, string userName)
        {

            if (userName == null)
                throw new UserNameIsRequiredException();
            if (!UserName.IsValid(userName))
                throw new InvalidUserNameException();

            if ((await _userManager.FindByNameAsync(userName)) != null)
                throw new EmailIsAlreadyTakenException();

            //update user name of account
            account.UpdateUserName(userName);
            var result = await _userManager.UpdateAsync(account);
            if (!result.Succeeded)
                throw new ServerSideException();

            //update token
            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task UpdatePasswordAsync(Account account, string currentPasword, string newPassword, string newPasswordConfirm)
        {
            if (currentPasword == null || newPassword == null)
                throw new PasswordIsRequiredException();
            if (newPassword != newPasswordConfirm)
                throw new PassowordAndPasswordConfirmationNotMatchException();
            if (newPassword.Length < 6)
                throw new PasswordTooShortException();
            if (!await _userManager.CheckPasswordAsync(account, currentPasword))
                throw new IncorrectPasswordException();

            //update password;
            var result = await _userManager.ChangePasswordAsync(account, currentPasword, newPassword);
            if (!result.Succeeded) throw new ServerSideException();

            //update token
            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task ConfirmEmailByToken(Account account, string token)
        {
            if(token == null)
                throw new EmailConfirmationTokenRequiredException();

            //confirmEmail
            try
            {
                account.ConfirmEmailByToken(token);
            }
            catch (InvalidEmailConfirmationToken)
            {
                await _userManager.UpdateAsync(account);
                throw;
            }
            await _userManager.UpdateAsync(account);

            //update token
            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task LoginByPassword(Account account, string password)
        {
            if (password == null)
                throw new PasswordIsRequiredException();
            if (!await _userManager.CheckPasswordAsync(account, password))
                throw new LoginFailedException();

            //update security stamp to revoke previous refresh token.
            var result = await _userManager.UpdateSecurityStampAsync(account);
            if (!result.Succeeded)
                throw new ServerSideException();

            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task<Account> LoginByFacebookAsync(string userId, CancellationToken cancellationToken)
        {
            if (userId == null)
                throw new ServerSideException();
            
            var account = await _userManager.FindByLoginAsync(LoginProvider.FaceBook,userId);
            if(account == null)
            {
                account = new Account();
                account.Create(null);

                var transaction = await _transactionCreator.CreateTransactionAsync(cancellationToken);
                
                //create account
                var result = await _userManager.CreateAsync(account);
                if (!result.Succeeded) throw new ServerSideException();
                
                //create user
                var user = new AppUser(account.Id);
                user.Create();
                await _userWriteRepository.CreateAsync(user, cancellationToken);
                
                //add role to account
                result = await _userManager.AddToRoleAsync(account, Roles.USER);
                if (!result.Succeeded) throw new ServerSideException();

                //add login to account
                result = await _userManager.AddLoginAsync(account, new(LoginProvider.FaceBook, userId, null));
                if (!result.Succeeded) throw new ServerSideException();

                await transaction.CommitAsync(cancellationToken);
            }
            else
            {
                //update security stamp to revoke previous refresh token.
                var result = await _userManager.UpdateSecurityStampAsync(account);
                if (!result.Succeeded) throw new ServerSideException();
            }
            await _tokenService.UpdateTokenAsync(account);
            return account;
        }
        public async Task<Account> LoginByGoogleAsync(GoogleUser googleUser,CancellationToken cancellationToken)
        {
            var account = await _userManager.FindByLoginAsync(LoginProvider.Google, googleUser.UserId);
            if (account == null)
            {

                if(googleUser.Email != null && (await _userManager.Users.AnyAsync(x => x.Email == googleUser.Email)))
                    throw new EmailIsAlreadyTakenException();

                account = new Account();
                account.Create(googleUser.Email);

                var transaction = await _transactionCreator.CreateTransactionAsync(cancellationToken);

                //create account
                var result = await _userManager.CreateAsync(account);
                if (!result.Succeeded) throw new ServerSideException();

                //create user
                var user = new AppUser(account.Id);
                user.Create();
                await _userWriteRepository.CreateAsync(user, cancellationToken);

                //add role to account
                result = await _userManager.AddToRoleAsync(account, Roles.USER);
                if (!result.Succeeded) throw new ServerSideException();

                //add login to account
                result = await _userManager.AddLoginAsync(account, new(LoginProvider.Google, googleUser.UserId, null));
                if (!result.Succeeded) throw new ServerSideException();

                await transaction.CommitAsync(cancellationToken);
            }
            else
            {
                //update security stamp to revoke previous refresh token.
                var result = await _userManager.UpdateSecurityStampAsync(account);
                if (!result.Succeeded) throw new ServerSideException();
            }
            await _tokenService.UpdateTokenAsync(account);
            return account;
        }
        public async Task LoginByRefreshToken(Account account, string refrehToken)
        {
            if (refrehToken == null)
                throw new RefreshTokenIsRequiredException();
            if (!await _tokenService.VerifyRefreshToken(account, refrehToken))
                throw new InvalidRefreshTokenException();
            
            //update security stamp to revoke previous refresh token.
            var result = await _userManager.UpdateSecurityStampAsync(account);
            if (!result.Succeeded) throw new ServerSideException();

            await _tokenService.UpdateTokenAsync(account);
        }
        public async Task LogOutAsync(Account account)
        {
            //update security stamp to revoke previous refresh token.
            var result = await _userManager.UpdateSecurityStampAsync(account);
            if (!result.Succeeded)
                throw new ServerSideException();
        }
    }
}
