using MySocailApp.Application.Extentions;
using MySocailApp.Application.Services.BlobService;
using MySocailApp.Core.Exceptions;


namespace MySocailApp.Api.Middlewares
{
    public class CustomExceptionHandlerMiddleware(RequestDelegate next)
    {
        private readonly RequestDelegate _next = next;

        public async Task InvokeAsync(HttpContext context,IBlobService blobService)
        {
            try
            {
                await _next(context);
            }
            catch (AppException ex)
            {
                await context.WriteAppExceptionAsync(ex);
                blobService.Rollback();
            }
            catch (Exception ex)
            {
                await context.WriteExceptionAsync(new ServerSideException(ex.InnerException?.Message ?? ex.Message));
                blobService.Rollback();
            }
        }
    }
}
