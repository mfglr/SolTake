using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Exceptions;
using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Security.Claims;
using System.Text;

namespace MySocailApp.Application.Extentions
{
    public static class HttpContextExtention
    {
        private static void ThrowExceptionIfContextIsNull(HttpContext? context)
        {
            if (context == null) throw new NotAuthorizedException();
        }

        public static string GetRequiredUserId(this HttpContext? context)
        {
            ThrowExceptionIfContextIsNull(context);
            return
                context!.User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.NameIdentifier)?.Value ??
                throw new NotAuthorizedException();
        }

        public static string GetLanguage(this HttpContext? context)
        {
            if (context == null) return Languages.EN;
            var culture = context!.Request.Headers.AcceptLanguage.FirstOrDefault();
            return Languages.GetLanguage(culture);
        }

        public static async Task WriteAppExceptionAsync(this HttpContext? context, string culture, AppException ex)
        {
            ThrowExceptionIfContextIsNull(context);
            var body = Encoding.UTF8.GetBytes(ex.GetErrorMessage(culture));
            context!.Response.StatusCode = ex.StatusCode;
            await context.Response.Body.WriteAsync(body);
        }
    }
}
