using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Exceptions;
using MySocailApp.Domain.AppVersionAggregate.Abstracts;
using MySocailApp.Domain.AppVersionAggregate.ValuObjects;

namespace MySocailApp.Api.HubFilters
{
    public class VersionHubFilter(IAppVersionCacheService versionCachService) : IHubFilter
    {
        private readonly IAppVersionCacheService _versionCachService = versionCachService;

        public async ValueTask<object?> InvokeMethodAsync(HubInvocationContext context, Func<HubInvocationContext, ValueTask<object?>> next)
        {
            var latestVersion = _versionCachService.Version;
            var versionCode = context.Context.GetHttpContext()!.Request.Headers.FirstOrDefault(x => x.Key.ToLower() == "client-version").Value.FirstOrDefault();

            if (versionCode == null || (latestVersion != null && latestVersion.UpgradeRequired(new VersionCode(versionCode))))
                throw new UpgradeRequiredException();

            return await next(context);
        }
    }
}
