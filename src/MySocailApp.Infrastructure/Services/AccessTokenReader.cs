using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Exceptions;
using MySocailApp.Application.Services;
using System.Security.Claims;

namespace MySocailApp.Infrastructure.Services
{
    public class AccessTokenReader(IHttpContextAccessor contextAccessor) : IAccessTokenReader
    {
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;

        private static void ThrowExceptionIfContextIsNull(HttpContext? context)
        {
            if (context == null) throw new NotAuthorizedException();
        }

        public string? GetAccountId()
        {
            var context = _contextAccessor.HttpContext;
            ThrowExceptionIfContextIsNull(context);
            return context!.User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.NameIdentifier)?.Value;
        }

        public string GetRequiredAccountId()
        {
            var context = _contextAccessor.HttpContext;
            ThrowExceptionIfContextIsNull(context);
            return 
                context!.User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.NameIdentifier)?.Value ?? 
                throw new NotAuthorizedException();
        }

        public string GetRequiredUserName()
        {
            var context = _contextAccessor.HttpContext;
            ThrowExceptionIfContextIsNull(context);
            return 
                context!.User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Name)?.Value ?? 
                throw new NotAuthorizedException();
        }

        public string GetRequiredEmail()
        {
            var context = _contextAccessor.HttpContext;
            ThrowExceptionIfContextIsNull(context);
            return
                context!.User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Email)?.Value ??
                throw new NotAuthorizedException();
        }
    }
}
