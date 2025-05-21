using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.UserUserSearchAggregate.DomainServices;

namespace SolTake.Domain.UserUserSearchAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserSearchDomainServices(this IServiceCollection services)
            =>
                services
                    .AddScoped<UserUserSearchCreatorDomainService>();
    }
}
