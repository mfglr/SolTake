using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.SolutionUserSaveAggregate.Abstracts;

namespace MySocailApp.Infrastructure.SolutionDomain.SolutionUserSaveAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionUserSaveAggregate(this IServiceCollection services)
            => services
                .AddScoped<ISolutionUserSaveWriteRepository, SolutionUserSaveWriteRepository>()
                .AddScoped<ISolutionUserSaveReadRepository, SolutionUserSaveReadRepository>();
    }
}
