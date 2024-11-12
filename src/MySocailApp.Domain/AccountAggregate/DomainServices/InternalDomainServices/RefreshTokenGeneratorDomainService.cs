using Microsoft.IdentityModel.Tokens;
using MySocailApp.Domain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountAggregate.Entities;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices
{
    internal static class RefreshTokenGeneratorDomainService
    {
        private static List<Claim> GetClaims(ITokenProviderOptions tokenProviderOptions, Account account)
            => [
                new (JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString()),
                new (ClaimTypes.NameIdentifier, account.Id.ToString()),
                new (JwtRegisteredClaimNames.Aud, tokenProviderOptions.Audience)
            ];

        public static string Generate(ITokenProviderOptions tokenProviderOptions, Account account)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(account.SecurityStamp!));
            var signingCredentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature);
            var expirationDateOfRefreshToken = DateTime.Now.AddMinutes(tokenProviderOptions.RefreshTokenExpiration);
            JwtSecurityToken jwtSecurityToken = new(
                issuer: tokenProviderOptions.Issuer,
                expires: expirationDateOfRefreshToken,
                notBefore: DateTime.Now,
                claims: GetClaims(tokenProviderOptions,account),
                signingCredentials: signingCredentials
            );
            return new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
        }
    }
}
