using SolTake.BlobService.Api;
using SolTake.Core.Exceptions;

namespace SolTake.BlobService.Api
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
                await context.WriteAppExceptionAsync("tr", ex);
            }
            catch (Exception ex)
            {
                if(ex.InnerException != null && ex.InnerException is AppException)
                {
                    await context.WriteAppExceptionAsync("tr", ex.InnerException as AppException);
                }
                else
                {
                    await context.WriteAppExceptionAsync("tr", new ServerSideException(ex.InnerException?.Message ?? ex.Message));
                }
            }
        }
    }
}
