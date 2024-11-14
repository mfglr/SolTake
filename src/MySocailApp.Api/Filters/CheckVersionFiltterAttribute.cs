using Microsoft.AspNetCore.Mvc.Filters;
using MySocailApp.Application.Exceptions;
using MySocailApp.Domain.AppVersionAggregate.Abstracts;
using MySocailApp.Domain.AppVersionAggregate.ValuObjects;

namespace MySocailApp.Api.Filters
{
    public class CheckVersionFiltterAttribute(IHttpContextAccessor contextAccessor, IAppVersionCacheService versionCachService) : ActionFilterAttribute
    {
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;
        private readonly IAppVersionCacheService _versionCachService = versionCachService;

        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var currentVersion = _versionCachService.Version;
            var versionCode = _contextAccessor.HttpContext!.Request.Headers.UserAgent.FirstOrDefault();

            if (versionCode == null || currentVersion.UpgradeRequired(new VersionCode(versionCode)))
                throw new UpgradeRequiredException();

            await next();
        }

    }
}
