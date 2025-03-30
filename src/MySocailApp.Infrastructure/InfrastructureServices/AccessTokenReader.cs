using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Exceptions;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using Newtonsoft.Json;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace MySocailApp.Infrastructure.InfrastructureServices
{
    public class AccessTokenReader(IHttpContextAccessor contextAccessor) : IAccessTokenReader
    {
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;
        
        public int? GetAccountId()
        {
            var context = _contextAccessor.HttpContext;
            if (context == null) return null;
            var value = context.User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.NameIdentifier)?.Value;
            return value != null ? int.Parse(value) : null;
        }
        public int GetRequiredAccountId()
        {
            var context = _contextAccessor.HttpContext ?? throw new NotAuthorizedException();
            var value =
                context.User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.NameIdentifier)?.Value ??
                throw new NotAuthorizedException();
            return int.Parse(value);
        }

        public string? GetUserName()
        {
            var context = _contextAccessor.HttpContext;
            if (context == null) return null;
            return context.User.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Name)?.Value;
        }

        public string? NickName()
        {
            var context = _contextAccessor.HttpContext;
            if (context == null) return null;
            return context.User.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Nickname)?.Value;
        }

        public Multimedia? GetMedia()
        {
            var context = _contextAccessor.HttpContext;
            if (context == null) return null;
            
            var mediaJson = context.User.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Picture)?.Value;
            if (mediaJson == null) return null;

            return JsonConvert.DeserializeObject<Multimedia>(mediaJson);
        }

        public Login GetLogin()
        {
            var context = _contextAccessor.HttpContext ?? throw new NotAuthorizedException();
            
            var userIdString =
                context.User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.NameIdentifier)?.Value ??
                throw new NotAuthorizedException();
            var userId = int.Parse(userIdString);

            var name = context.User.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Nickname)?.Value;

            var userName = context.User.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Name)!.Value;

            var mediaJson = context.User.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Picture)?.Value;
            var media = mediaJson == null ? null : JsonConvert.DeserializeObject<Multimedia>(mediaJson);

            return new(userId, userName, name, media);
        }
    }
}
