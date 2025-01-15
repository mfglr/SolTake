using AccountDomain.Configurations;
using AccountDomain.Exceptions;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace AccountDomain.DomainServices
{
    public class RefreshTokenValidatorDomainService(ITokenProviderOptions tokenProviderOptions)
    {
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;

        public async Task ValidateAsync(Entities.Account account, string token)
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
            var idString = result.Claims.First(x => x.Key == ClaimTypes.NameIdentifier).Value as string;

            if (!result.IsValid || idString == null)
                throw new InvalidRefreshTokenException();

            var id = int.Parse(idString);

            if (id != account.Id)
                throw new InvalidRefreshTokenException();
        }
    }
}
