using Microsoft.IdentityModel.Tokens;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.DomainServices
{
    public class RefreshTokenValidatorDomainService(ITokenProviderOptions tokenProviderOptions)
    {
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;

        public async Task ValidateAsync(Account account, string token)
        {
            var handler = new JwtSecurityTokenHandler();
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(account.SecurityStamp));
            var validationParameters = new TokenValidationParameters()
            {
                IssuerSigningKey = securityKey,
                ValidIssuer = _tokenProviderOptions.Issuer,
                ValidAudience = _tokenProviderOptions.Audience,

                ValidateIssuerSigningKey = true,
                ValidateIssuer = true,
                ValidateLifetime = true,
                ValidateAudience = true,
                ClockSkew = TimeSpan.Zero
            };

            var result = await handler.ValidateTokenAsync(token, validationParameters);
            var id = int.Parse((result.Claims.First(x => x.Key == ClaimTypes.NameIdentifier).Value as string)!);

            if (!result.IsValid || id != account.Id)
                throw new InvalidRefreshTokenException();
        }
    }
}
