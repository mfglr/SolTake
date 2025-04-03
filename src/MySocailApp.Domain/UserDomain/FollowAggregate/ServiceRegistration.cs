using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserDomain.FollowAggregate.DomainServices;

namespace MySocailApp.Domain.UserDomain.FollowAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddFollowAggregate(this IServiceCollection services)
            => services.AddScoped<UserFollowerDomainService>();
    }
}
