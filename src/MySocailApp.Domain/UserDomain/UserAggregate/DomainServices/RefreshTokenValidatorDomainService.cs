using Microsoft.IdentityModel.Tokens;
using MySocailApp.Domain.UserDomain.UserAggregate.Configurations;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MySocailApp.Domain.UserDomain.UserAggregate.DomainServices
{
    public class RefreshTokenValidatorDomainService(ITokenProviderOptions tokenProviderOptions)
    {
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;

        public async Task ValidateAsync(User user, string token)
        {
            var handler = new JwtSecurityTokenHandler();
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(user.SecurityStamp));
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
            if (!result.IsValid)
                throw new InvalidRefreshTokenException();

            var idString = result.Claims.First(x => x.Key == ClaimTypes.NameIdentifier).Value as string;
            if (idString == null)
                throw new InvalidRefreshTokenException();
            var id = int.Parse(idString);

            if (id != user.Id)
                throw new InvalidRefreshTokenException();
        }
    }
}
