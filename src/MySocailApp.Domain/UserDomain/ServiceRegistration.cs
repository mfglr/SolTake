using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserDomain.UserAggregate;

namespace MySocailApp.Domain.UserDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserDomain(this IServiceCollection services)
            => services
                .AddUserAggregate();
    }
}
