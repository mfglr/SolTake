using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Application.InfrastructureServices
{
    public interface IUserAccessor
    {
        public User User { get; set; }
    }
}
