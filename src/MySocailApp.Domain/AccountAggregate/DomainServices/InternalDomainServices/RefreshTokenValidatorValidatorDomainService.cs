using Microsoft.IdentityModel.Tokens;
using MySocailApp.Domain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices
{
    internal static class RefreshTokenValidatorValidatorDomainService
    {
        public static async Task ValidateAsync(int accountId, string securityStamp, string token, ITokenProviderOptions tokenProviderOptions)
        {
            var handler = new JwtSecurityTokenHandler();
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(securityStamp));
            var validationParameters = new TokenValidationParameters()
            {
                IssuerSigningKey = securityKey,
                ValidIssuer = tokenProviderOptions.Issuer,
                ValidAudience = tokenProviderOptions.Audience,

                ValidateIssuerSigningKey = true,
                ValidateIssuer = true,
                ValidateLifetime = true,
                ValidateAudience = true,
            };

            var result = await handler.ValidateTokenAsync(token, validationParameters);
            if (!result.IsValid)
                throw new InvalidRefreshTokenException();

            var id = int.Parse((result.Claims.First(x => x.Key == ClaimTypes.NameIdentifier).Value as string)!);

            if (id != accountId)
                throw new InvalidRefreshTokenException();
        }
    }
}
