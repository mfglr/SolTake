using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserDomain.FollowAggregate;
using MySocailApp.Domain.UserDomain.UserAggregate;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate;

namespace MySocailApp.Domain.UserDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserDomain(this IServiceCollection services)
            => services
                .AddUserAggregate()
                .AddFollowAggregate()
                .AddUserUserBlockAggregateServices();
    }
}
