using Microsoft.IdentityModel.Tokens;
using MySocailApp.Domain.UserAggregate.Configurations;
using MySocailApp.Domain.UserAggregate.Entities;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MySocailApp.Domain.UserAggregate.DomainServices
{
    public class RefreshTokenSetterDomainService(ITokenProviderOptions tokenProviderOptions)
    {
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;

        private static List<Claim> GetClaims(ITokenProviderOptions tokenProviderOptions, User user)
            => [
                new (JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString()),
                new (ClaimTypes.NameIdentifier, user.Id.ToString()),
                new (JwtRegisteredClaimNames.Aud, tokenProviderOptions.Audience)
            ];

        public void Set(User user)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(user.SecurityStamps.Last().Value));
            var signingCredentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature);
            var expirationDateOfRefreshToken = DateTime.Now.AddMinutes(_tokenProviderOptions.RefreshTokenExpiration);
            JwtSecurityToken jwtSecurityToken = new(
                issuer: _tokenProviderOptions.Issuer,
                expires: expirationDateOfRefreshToken,
                notBefore: DateTime.Now,
                claims: GetClaims(_tokenProviderOptions, user),
                signingCredentials: signingCredentials
            );
            user.RefreshToken = new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
        }
    }
}
