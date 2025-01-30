namespace AccountDomain.AccountAggregate.Entities
{
    public class AccountPrivacyPolicy
    {
        public int PolicyId { get; private set; }
        public int AccountId { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public bool IsApproved { get; private set; }
        public DateTime? ApprovedAt { get; private set; }

        private AccountPrivacyPolicy(int policyId) => PolicyId = policyId;

        internal static AccountPrivacyPolicy Create(int policyId)
            => new(policyId) { IsApproved = false, CreatedAt = DateTime.UtcNow };

        internal void Approve()
        {
            ApprovedAt = DateTime.UtcNow;
            IsApproved = true;
        }
    }
}
