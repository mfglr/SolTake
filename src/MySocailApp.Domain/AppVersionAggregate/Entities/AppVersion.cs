using MySocailApp.Core;
using MySocailApp.Domain.AppVersionAggregate.ValuObjects;

namespace MySocailApp.Domain.AppVersionAggregate.Entities
{
    public class AppVersion : IHasId
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public VersionCode Code { get; private set; } = null!;
        public bool IsUpgradeRequired { get; private set; }

        private AppVersion() { }

        public AppVersion(VersionCode code, bool isUpgradeRequired)
        {
            Code = code;
            IsUpgradeRequired = isUpgradeRequired;
        }
        internal void Create() => CreatedAt = DateTime.UtcNow;

        public bool UpgradeRequired(VersionCode code) => IsUpgradeRequired && VersionCode.CompareTo(code, Code) < 0;
    }
}
