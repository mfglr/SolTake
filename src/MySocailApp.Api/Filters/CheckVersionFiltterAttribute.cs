using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.Exceptions;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Api.Filters
{
    public class CheckVersionFiltterAttribute(IHttpContextAccessor contextAccessor, IVersionCacheService versionCachService) : ActionFilterAttribute
    {
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;
        private readonly IVersionCacheService _versionCachService = versionCachService;

        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var currentVersion = _versionCachService.Version;

            var versionCodeString = _contextAccessor.HttpContext!.Request.Headers.UserAgent.FirstOrDefault();
            var versionCode = versionCodeString != null ? int.Parse(versionCodeString) : 1;

            if (currentVersion.IsUpgradeRequired && versionCode < currentVersion.Code)
                throw new UpgradeRequiredException();

            await next();
        }

    }
}
