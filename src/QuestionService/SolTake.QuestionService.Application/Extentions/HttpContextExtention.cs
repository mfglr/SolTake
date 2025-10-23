using Microsoft.AspNetCore.Http;
using SolTake.Core.Exceptions;
using SolTake.QuestionService.Application.Exceptions;
using System.Security.Claims;
using System.Text;

namespace SolTake.QuestionService.Application.Extentions
{
    public static class HttpContextExtention
    {
        private static void ThrowExceptionIfContextIsNull(HttpContext? context)
        {
            if (context == null) throw new NotAuthorizedException();
        }

        public static int GetRequiredUserId(this HttpContext? context)
        {
            ThrowExceptionIfContextIsNull(context);
            var id = context!.User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.NameIdentifier)?.Value ??
                throw new NotAuthorizedException();
            return int.Parse(id);
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
