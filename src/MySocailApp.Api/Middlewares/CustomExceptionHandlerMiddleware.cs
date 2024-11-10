using MySocailApp.Application.Extentions;
using MySocailApp.Core.Exceptions;


namespace MySocailApp.Api.Middlewares
{
    public class CustomExceptionHandlerMiddleware(RequestDelegate next)
    {
        private readonly RequestDelegate _next = next;

        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (AppException ex)
            {
                await context.WriteAppExceptionAsync(context.GetLanguage(), ex);
            }
            catch (Exception ex)
            {
                await context.WriteAppExceptionAsync(context.GetLanguage(), new ServerSideException());
            }
        }
    }
}
