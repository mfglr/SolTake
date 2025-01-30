namespace AccountDomain.AccountAggregate.Entities
{
    public class AccountTermsOfUse
    {
        public int AccountId { get; private set; }
        public int TermsOfUseId { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public bool IsApproved { get; private set; }
        public DateTime? ApprovedAt { get; private set; }

        private AccountTermsOfUse(int termsOfUseId) => TermsOfUseId = termsOfUseId;

        internal static AccountTermsOfUse Create(int termsOfUseId)
            => new(termsOfUseId) { IsApproved = false, CreatedAt = DateTime.UtcNow };

        internal void Approve()
        {
            ApprovedAt = DateTime.UtcNow;
            IsApproved = true;
        }
    }
}
