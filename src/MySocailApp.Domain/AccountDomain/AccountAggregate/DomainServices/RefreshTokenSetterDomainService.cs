using Microsoft.IdentityModel.Tokens;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.DomainServices
{
    public class RefreshTokenSetterDomainService(ITokenProviderOptions tokenProviderOptions)
    {
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;

        private static List<Claim> GetClaims(ITokenProviderOptions tokenProviderOptions, Account account)
            => [
                new (JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString()),
                new (ClaimTypes.NameIdentifier, account.Id.ToString()),
                new (JwtRegisteredClaimNames.Aud, tokenProviderOptions.Audience)
            ];

        public void Set(Account account)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(account.SecurityStamp));
            var signingCredentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature);
            var expirationDateOfRefreshToken = DateTime.Now.AddMinutes(_tokenProviderOptions.RefreshTokenExpiration);
            JwtSecurityToken jwtSecurityToken = new(
                issuer: _tokenProviderOptions.Issuer,
                expires: expirationDateOfRefreshToken,
                notBefore: DateTime.Now,
                claims: GetClaims(_tokenProviderOptions, account),
                signingCredentials: signingCredentials
            );
            account.RefreshToken = new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
        }
    }
}
