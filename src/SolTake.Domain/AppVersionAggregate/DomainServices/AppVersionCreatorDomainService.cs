using SolTake.Domain.AppVersionAggregate.Abstracts;
using SolTake.Domain.AppVersionAggregate.Entities;
using SolTake.Domain.AppVersionAggregate.Exceptions;
using SolTake.Domain.AppVersionAggregate.ValuObjects;

namespace MySocailApp.Domain.AppVersionAggregate.DomainServices
{
    public class AppVersionCreatorDomainService(IAppVersionCacheService appVersionCacheService)
    {
        private readonly IAppVersionCacheService _appVersionCacheService = appVersionCacheService;

        public void Create(AppVersion version)
        {
            var latestVersion = _appVersionCacheService.Version;

            if (latestVersion != null && VersionCode.CompareTo(version.Code, latestVersion.Code) <= 0)
                throw new InvalidVersionCodeException();

            version.Create();
        }
    }
}
