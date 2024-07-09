using Microsoft.AspNetCore.Identity;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Domain.AccountAggregate
{
    public class LoginManager(IAppUserRepository userRepository, UserManager<Account> userManager, ITokenService tokenService)
    {
        private readonly IAppUserRepository _userRepository = userRepository;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenService _tokenService = tokenService;

        private async Task Login(Account account)
        {
            //update security stamp to revoke previous refresh token.
            var result = await _userManager.UpdateSecurityStampAsync(account);
            if (!result.Succeeded)
                throw new ServerSideException(result.Errors.Select(x => x.Description).ToList());

            await _tokenService.UpdateTokenAsync(account);
        }


        public async Task LoginByPassword(Account account,string password, CancellationToken cancellationToken)
        {
            if (!await _userManager.CheckPasswordAsync(account, password))
                throw new LoginFailedException();

            if (account.IsRemoved)
            {
                account.Restore();
                var user = await _userRepository.GetWithAllAsync(account.Id, cancellationToken);
                user.Restore();
            }

            await Login(account);
        }

        public async Task LoginByRefreshToken(Account account,string refrehToken)
        {
            if (!await _tokenService.VerifyRefreshToken(account, refrehToken))
                throw new InvalidRefreshTokenException();
            await Login(account);
        }
    }

}
