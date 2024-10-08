using Microsoft.IdentityModel.Tokens;
using MySocailApp.Domain.AccountAggregate.Configurations;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices
{
    internal static class RefreshTokenGeneratorDomainService
    {
        private static List<Claim> GetClaims(int accountId, ITokenProviderOptions tokenProviderOptions)
            => [
                new (JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString()),
                new (ClaimTypes.NameIdentifier, accountId.ToString()),
                new (JwtRegisteredClaimNames.Aud, tokenProviderOptions.Audience)
            ];

        public static string Generate(int accountId, string securityStamp, ITokenProviderOptions tokenProviderOptions)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(securityStamp));
            var signingCredentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature);
            var expirationDateOfRefreshToken = DateTime.Now.AddMinutes(tokenProviderOptions.RefreshTokenExpiration);
            JwtSecurityToken jwtSecurityToken = new(
                issuer: tokenProviderOptions.Issuer,
                expires: expirationDateOfRefreshToken,
                notBefore: DateTime.Now,
                claims: GetClaims(accountId, tokenProviderOptions),
                signingCredentials: signingCredentials
            );
            return new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
        }
    }
}
