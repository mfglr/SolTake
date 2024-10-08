namespace MySocailApp.Domain.TermsOfUseAggregate
{
    public class TermsOfUse
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { private set; get; }
        public int AdminId { private set; get; }
        public string BlobNameTr { get; private set; }
        public string BlobNameEn { get; private set; }

        private TermsOfUse(int adminId, string blobNameTr,string blobNameEn)
        {
            AdminId = adminId;
            BlobNameTr = blobNameTr;
            BlobNameEn = blobNameEn;
        }

        public static TermsOfUse Create(int adminId, string blobNameTr, string blobNameEn )
            => new(adminId, blobNameTr, blobNameEn) { CreatedAt = DateTime.UtcNow };
    }
}
