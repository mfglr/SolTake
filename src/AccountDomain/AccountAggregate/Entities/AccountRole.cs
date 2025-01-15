namespace AccountDomain.Entities
{
    public class AccountRole(int roleId)
    {
        public int AccountId { get; private set; }
        public int RoleId { get; private set; } = roleId;
    }
}
