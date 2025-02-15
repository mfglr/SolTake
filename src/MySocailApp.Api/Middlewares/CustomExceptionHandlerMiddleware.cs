using MySocailApp.Application.Extentions;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.UserDomain.UserAggregate.ValueObjects;

namespace MySocailApp.Api.Middlewares
{
    public class CustomExceptionHandlerMiddleware(RequestDelegate next)
    {
        private readonly RequestDelegate _next = next;

        public async Task InvokeAsync(HttpContext context, IUserAccessor userAccessor)
        {
            try
            {
                await _next(context);
            }
            catch (AppException ex)
            {
                var languge = userAccessor.User?.Language ?? new Language(context.GetLanguage());
                await context.WriteAppExceptionAsync(languge.Value, ex);
            }
            catch (Exception ex)
            {
                var languge = userAccessor.User?.Language ?? new Language(context.GetLanguage());
                await context.WriteAppExceptionAsync(languge.Value, new ServerSideException(ex.InnerException?.Message ?? ex.Message));
            }
        }
    }
}
