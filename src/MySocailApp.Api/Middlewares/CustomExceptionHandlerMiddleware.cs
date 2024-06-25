using MySocailApp.Core.Exceptions;
using MySocailApp.Application.Extentions;


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
                await context.WriteAppExceptionAsync(ex);
            }
            catch (Exception ex)
            {
                await context.WriteExceptionAsync(new ServerSideException(ex.InnerException?.Message ?? ex.Message));
            }
        }
    }
}
