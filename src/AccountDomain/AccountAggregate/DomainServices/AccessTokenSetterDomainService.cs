using AccountDomain.AccountAggregate.Configurations;
using AccountDomain.AccountAggregate.Entities;
using AccountDomain.RoleAggregate.Abstracts;
using AccountDomain.RoleAggregate.Entities;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace AccountDomain.AccountAggregate.DomainServices
{
    public class AccessTokenSetterDomainService(ITokenProviderOptions tokenProviderOptions, IRoleReadRepository roleReadRepository)
    {
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;
        private readonly IRoleReadRepository _roleReadRepository = roleReadRepository;

        private List<Claim> GetClaims(Account account, IEnumerable<Role> roles)
        {
            var claims = new List<Claim>()
            {
                new (JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString()),
                new (JwtRegisteredClaimNames.Aud, _tokenProviderOptions.Audience),
                new (ClaimTypes.NameIdentifier, account.Id.ToString()),
            };

            foreach (var role in roles)
                claims.Add(new(ClaimTypes.Role, role.Name));
            return claims;
        }

        public async Task SetAsync(Account account, CancellationToken cancellationToken)
        {
            var roles = await _roleReadRepository.GetRolesByIdsAsync(account.Roles.Select(x => x.RoleId), cancellationToken);

            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_tokenProviderOptions.SecurityKey));
            var expirationDateOfAccessToken = DateTime.Now.AddMinutes(_tokenProviderOptions.AccessTokenExpiration);
            JwtSecurityToken jwtSecurityToken = new(
                issuer: _tokenProviderOptions.Issuer,
                expires: expirationDateOfAccessToken,
                notBefore: DateTime.Now,
                claims: GetClaims(account, roles),
                signingCredentials: new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature)
            );
            account.AccessToken = new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
        }
    }
}
