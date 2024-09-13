using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.Extentions;
using MySocailApp.Core;
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
                var culture = context.Request.Headers.AcceptLanguage.FirstOrDefault();
                string language = Languages.GetLanguage(culture);
                await context.WriteAppExceptionAsync(language, ex);
                blobService.Rollback();
            }
            catch (Exception)
            {
                await context.WriteExceptionAsync(new ServerSideException());
                blobService.Rollback();
            }
        }
    }
}
