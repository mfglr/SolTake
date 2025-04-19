using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserUserFollowAggregate.DomainServices;

namespace MySocailApp.Domain.UserUserFollowAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserFollowAggregate(this IServiceCollection services)
            => services.AddScoped<UserUserFollowCreatorDomainService>();
    }
}
