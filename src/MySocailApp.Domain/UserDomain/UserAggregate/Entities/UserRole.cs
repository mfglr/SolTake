namespace MySocailApp.Domain.UserDomain.UserAggregate.Entities
{
    public class UserRole(int roleId)
    {
        public int UserId { get; private set; }
        public int RoleId { get; private set; } = roleId;
    }
}
