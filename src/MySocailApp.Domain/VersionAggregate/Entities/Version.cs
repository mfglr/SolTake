using MySocailApp.Core;

namespace MySocailApp.Domain.VersionAggregate.Entities
{
    public class Version : IHasId
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int Code { get; private set; }
        public bool IsUpgradeRequired { get; private set; }

        private Version(int code, bool isUpgradeRequired)
        {
            Code = code;
            IsUpgradeRequired = isUpgradeRequired;
        }
        public static Version Create(int code, bool isUpgradeRequired) => new(code, isUpgradeRequired) { CreatedAt = DateTime.UtcNow };
    }
}
