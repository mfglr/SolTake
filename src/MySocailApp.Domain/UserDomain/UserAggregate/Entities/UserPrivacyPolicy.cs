namespace MySocailApp.Domain.UserDomain.UserAggregate.Entities
{
    public class UserPrivacyPolicy
    {
        public int UserId { get; private set; }
        public int PravicyPolicyId { get; private set; }

        public DateTime CreatedAt { get; private set; }
        public bool IsApproved { get; private set; }
        public DateTime? ApprovedAt { get; private set; }

        private UserPrivacyPolicy(int pravicyPolicyId) => PravicyPolicyId = pravicyPolicyId;

        internal static UserPrivacyPolicy Create(int pravicyPolicyId)
            => new(pravicyPolicyId) { IsApproved = false, CreatedAt = DateTime.UtcNow };

        internal void Approve()
        {
            ApprovedAt = DateTime.UtcNow;
            IsApproved = true;
        }
    }
}
