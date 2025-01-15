using MySocailApp.Core;

namespace AccountDomain.RoleAggregate.Entities
{
    public class Role : IHasId, IAggregateRoot
    {
        public int Id { get; private set; }
        public string Name { get; private set; }

        public Role(string name) => Name = name;
    }
}
