﻿using Microsoft.AspNetCore.Http;
using SolTake.Application.Exceptions;
using SolTake.Application.InfrastructureServices;
using Newtonsoft.Json;
using SolTake.Core;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Linq;

namespace SolTake.Infrastructure.InfrastructureServices
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

            var nameValue = context.User.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Nickname)?.Value;
            var name = nameValue == "" ? null : nameValue;

            var userName = context.User.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Name)!.Value;

            var mediaJson = context.User.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Picture)?.Value;
            var media = mediaJson == null ? null : JsonConvert.DeserializeObject<Multimedia>(mediaJson);

            return new(userId, userName, name, media);
        }

        public string? GetLanguage()
        {
            var context = _contextAccessor.HttpContext;
            if (context == null) return null;

            return context.User.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Locale)?.Value;
        }

        public bool IsAdmin()
        {
            var context = _contextAccessor.HttpContext;
            if (context == null) return false;
            var roles = context.User.Claims.Where(x => x.Type == ClaimTypes.Role);
            if(roles == null) return false;

            return roles.Any(x => x.Value == "admin");
        }
    }
}
