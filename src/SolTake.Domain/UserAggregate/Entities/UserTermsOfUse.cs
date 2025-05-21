namespace SolTake.Domain.UserAggregate.Entities
{
    public class UserTermsOfUse
    {
        public int UserId { get; private set; }
        public int TermsOfUseId { get; private set; }

        public DateTime CreatedAt { get; private set; }
        public bool IsApproved { get; private set; }
        public DateTime? ApprovedAt { get; private set; }

        private UserTermsOfUse(int termsOfUseId) => TermsOfUseId = termsOfUseId;

        internal static UserTermsOfUse Create(int termsOfUseId)
            => new(termsOfUseId) { IsApproved = false, CreatedAt = DateTime.UtcNow };

        internal void Approve()
        {
            ApprovedAt = DateTime.UtcNow;
            IsApproved = true;
        }
    }
}
