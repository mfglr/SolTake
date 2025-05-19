using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.SolutionUserSaveAggregate.DomainServices;

namespace MySocailApp.Domain.SolutionUserSaveAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionUserSaveDomainServices(this IServiceCollection services)
            => services
                .AddScoped<SolutionUserSaveCreatorDomainService>();
    }
}
