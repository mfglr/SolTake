using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.AppVersionAggregate.DomainServices;

namespace MySocailApp.Domain.AppVersionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddAppVersionDomainServices(this IServiceCollection services)
            => services
                .AddScoped<AppVersionCreatorDomainService>();
    }
}
