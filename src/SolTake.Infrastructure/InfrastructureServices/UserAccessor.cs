using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Entities;

namespace SolTake.Infrastructure.InfrastructureServices
{
    public class UserAccessor : IUserAccessor
    {
        public User User { get; set; }
    }
}
