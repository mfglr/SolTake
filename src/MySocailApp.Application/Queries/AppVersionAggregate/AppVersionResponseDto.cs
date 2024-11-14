namespace MySocailApp.Application.Queries.AppVersionAggregate
{
    public class AppVersionResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public string VersionCode { get; private set; }
        public bool IsUpgradeRequired { get; private set; }
        
        private AppVersionResponseDto() { }

        public AppVersionResponseDto(int id, DateTime createdAt, string versionCode, bool isUpgradeRequired)
        {
            Id = id;
            CreatedAt = createdAt;
            VersionCode = versionCode;
            IsUpgradeRequired = isUpgradeRequired;
        }
    }
}
