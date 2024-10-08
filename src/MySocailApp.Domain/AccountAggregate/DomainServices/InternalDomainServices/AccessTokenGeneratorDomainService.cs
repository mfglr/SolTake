using Microsoft.IdentityModel.Tokens;
using MySocailApp.Domain.AccountAggregate.Configurations;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices
{
    internal static class AccessTokenGeneratorDomainService
    {
        private static List<Claim> GetClaims(int accountId, IEnumerable<string> roles, ITokenProviderOptions tokenProviderOptions)
        {
            var claims = new List<Claim>()
            {
                new (JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString()),
                new (ClaimTypes.NameIdentifier, accountId.ToString()),
                new (JwtRegisteredClaimNames.Aud, tokenProviderOptions.Audience)
            };
            foreach (var role in roles)
                claims.Add(new(ClaimTypes.Role, role));
            return claims;
        }

        public static string Generate(int accountId, IEnumerable<string> roles, ITokenProviderOptions tokenProviderOptions)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(tokenProviderOptions.SecurityKey));
            var expirationDateOfAccessToken = DateTime.Now.AddMinutes(tokenProviderOptions.AccessTokenExpiration);
            JwtSecurityToken jwtSecurityToken = new(
                issuer: tokenProviderOptions.Issuer,
                expires: expirationDateOfAccessToken,
                notBefore: DateTime.Now,
                claims: GetClaims(accountId, roles, tokenProviderOptions),
                signingCredentials: new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature)
            );
            return new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
        }
    }
}
