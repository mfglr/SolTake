﻿using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Exceptions;
using MySocailApp.Application.InfrastructureServices;
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
    }
}
