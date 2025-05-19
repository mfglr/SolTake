using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Infrastructure.InfrastructureServices
{
    public class UserAccessor : IUserAccessor
    {
        public User User { get; set; }
    }
}
