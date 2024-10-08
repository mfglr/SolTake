using MySocailApp.Core;

namespace MySocailApp.Domain.PrivacyPolicyAggregate
{
    public class PrivacyPolicy : IHasId
    {
        public int Id { private set; get; }
        public DateTime CreatedAt { private set; get; }
        public int AdminId { private set; get; }
        public string BlobNameTr { get; private set; }
        public string BlobNameEn { get; private set; }

        private PrivacyPolicy(int adminId, string blobNameTr, string blobNameEn)
        {
            ArgumentNullException.ThrowIfNull(blobNameTr);
            ArgumentNullException.ThrowIfNull(blobNameEn);

            AdminId = adminId;
            BlobNameTr = blobNameTr;
            BlobNameEn = blobNameEn;
        }

        public static PrivacyPolicy Create(int adminId, string blobNameTr, string blobNameEn) 
            => new(adminId, blobNameTr,blobNameEn) { CreatedAt = DateTime.UtcNow };
    }
}
