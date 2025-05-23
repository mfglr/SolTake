using SolTake.Domain.UserAggregate.Entities;

namespace SolTake.Application.InfrastructureServices
{
    public interface IUserAccessor
    {
        public User User { get; set; }
    }
}
