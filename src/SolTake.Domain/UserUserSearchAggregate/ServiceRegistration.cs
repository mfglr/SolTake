using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserUserSearchAggregate.DomainServices;

namespace MySocailApp.Domain.UserUserSearchAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserSearchDomainServices(this IServiceCollection services)
            =>
                services
                    .AddScoped<UserUserSearchCreatorDomainService>();
    }
}
