using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.UserUserFollowAggregate.DomainServices;

namespace SolTake.Domain.UserUserFollowAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserFollowAggregate(this IServiceCollection services)
            => services.AddScoped<UserUserFollowCreatorDomainService>();
    }
}
