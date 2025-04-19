using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Application.InfrastructureServices
{
    public interface IUserAccessor
    {
        public User User { get; set; }
    }
}
