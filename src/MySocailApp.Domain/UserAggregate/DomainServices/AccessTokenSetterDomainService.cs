﻿using Microsoft.IdentityModel.Tokens;
using MySocailApp.Domain.RoleAggregate.Abstracts;
using MySocailApp.Domain.RoleAggregate.Entities;
using MySocailApp.Domain.UserAggregate.Configurations;
using MySocailApp.Domain.UserAggregate.Entities;
using Newtonsoft.Json;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace MySocailApp.Domain.UserAggregate.DomainServices
{
    public class AccessTokenSetterDomainService(ITokenProviderOptions tokenProviderOptions, IRoleReadRepository roleReadRepository)
    {
        private readonly ITokenProviderOptions _tokenProviderOptions = tokenProviderOptions;
        private readonly IRoleReadRepository _roleReadRepository = roleReadRepository;

        private List<Claim> GetClaims(User user, IEnumerable<Role> roles)
        {
            var claims = new List<Claim>()
            {
                new (JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString()),
                new (JwtRegisteredClaimNames.Aud, _tokenProviderOptions.Audience),
                new (ClaimTypes.NameIdentifier, user.Id.ToString()),
                new (JwtRegisteredClaimNames.Name,user.UserName.Value),
                new (JwtRegisteredClaimNames.Nickname,user.Name ?? ""),
                new (JwtRegisteredClaimNames.Picture, JsonConvert.SerializeObject(user.Image)),
            };

            foreach (var role in roles)
                claims.Add(new(ClaimTypes.Role, role.Name));
            return claims;
        }

        public async Task SetAsync(User user, CancellationToken cancellationToken)
        {
            var roles = await _roleReadRepository.GetRolesByIdsAsync(user.Roles.Select(x => x.RoleId), cancellationToken);

            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_tokenProviderOptions.SecurityKey));
            var expirationDateOfAccessToken = DateTime.Now.AddMinutes(_tokenProviderOptions.AccessTokenExpiration);
            JwtSecurityToken jwtSecurityToken = new(
                issuer: _tokenProviderOptions.Issuer,
                expires: expirationDateOfAccessToken,
                notBefore: DateTime.Now,
                claims: GetClaims(user, roles),
                signingCredentials: new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature)
            );
            user.AccessToken = new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
        }
    }
}
