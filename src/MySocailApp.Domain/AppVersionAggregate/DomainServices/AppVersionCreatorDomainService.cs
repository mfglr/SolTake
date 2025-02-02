using MySocailApp.Domain.AppVersionAggregate.Abstracts;
using MySocailApp.Domain.AppVersionAggregate.Entities;
using MySocailApp.Domain.AppVersionAggregate.Exceptions;
using MySocailApp.Domain.AppVersionAggregate.ValuObjects;

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
