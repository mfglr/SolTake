using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.DomainServices;

namespace MySocailApp.Domain.UserDomain.UserUserBlockAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserBlockAggregateServices(this IServiceCollection services)
            => services
                .AddScoped<UserUserBlockCreatorDomainService>();
    }
}
