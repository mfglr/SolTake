using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using MySocailApp.Domain.AccountAggregate.Configurations;
using MySocailApp.Domain.AccountAggregate.Entities;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices
{
    internal static class AccessTokenGeneratorDomainService
    {
        private static List<Claim> GetClaims(ITokenProviderOptions tokenProviderOptions, Account account, IEnumerable<string> roles)
        {
            var claims = new List<Claim>()
            {
                new (JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString()),
                new (JwtRegisteredClaimNames.Aud, tokenProviderOptions.Audience),
                new (ClaimTypes.NameIdentifier, account.Id.ToString()),
            };
            
            foreach (var role in roles)
                claims.Add(new(ClaimTypes.Role, role));

            return claims;
        }

        public static async Task<string> GenerateAsync(ITokenProviderOptions tokenProviderOptions, UserManager<Account> userManager, Account account)
        {
            var roles = await userManager.GetRolesAsync(account);
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(tokenProviderOptions.SecurityKey));
            var expirationDateOfAccessToken = DateTime.Now.AddMinutes(tokenProviderOptions.AccessTokenExpiration);
            JwtSecurityToken jwtSecurityToken = new(
                issuer: tokenProviderOptions.Issuer,
                expires: expirationDateOfAccessToken,
                notBefore: DateTime.Now,
                claims: GetClaims(tokenProviderOptions, account, roles),
                signingCredentials: new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature)
            );
            return new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
        }
    }
}
