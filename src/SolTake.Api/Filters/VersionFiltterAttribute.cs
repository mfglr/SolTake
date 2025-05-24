using Microsoft.AspNetCore.Mvc.Filters;
using SolTake.Application.Exceptions;
using SolTake.Domain.AppVersionAggregate.Abstracts;
using SolTake.Domain.AppVersionAggregate.ValuObjects;

namespace SolTake.Api.Filters
{
    public class VersionFiltterAttribute(IHttpContextAccessor contextAccessor, IAppVersionCacheService versionCachService) : ActionFilterAttribute
    {
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;
        private readonly IAppVersionCacheService _versionCachService = versionCachService;

        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var latestVersion = _versionCachService.Version;
            var versionCode = _contextAccessor.HttpContext!.Request.Headers.FirstOrDefault(x => x.Key.ToLower() == "client-version").Value.FirstOrDefault();

            if (versionCode == null || (latestVersion != null && latestVersion.UpgradeRequired(new VersionCode(versionCode))))
                throw new UpgradeRequiredException();

            await next();
        }

    }
}
