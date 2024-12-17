using MySocailApp.Application.Extentions;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountDomain.AccountAggregate.ValueObjects;


namespace MySocailApp.Api.Middlewares
{
    public class CustomExceptionHandlerMiddleware(RequestDelegate next)
    {
        private readonly RequestDelegate _next = next;

        public async Task InvokeAsync(HttpContext context)
        {
            var languge = new Language(context.GetLanguage());
            try
            {
                await _next(context);
            }
            catch (AppException ex)
            {
                await context.WriteAppExceptionAsync(languge.Value, ex);
            }
            catch (Exception ex)
            {
                await context.WriteAppExceptionAsync(languge.Value, new ServerSideException());
            }
        }
    }
}
