using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.FollowAggregate.DomainServices;

namespace MySocailApp.Domain.FollowAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddFollowAggregate(this IServiceCollection services)
            => services.AddScoped<UserFollowerDomainService>();
    }
}
