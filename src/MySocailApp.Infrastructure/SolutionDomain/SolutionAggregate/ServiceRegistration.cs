using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;

namespace MySocailApp.Infrastructure.SolutionDomain.SolutionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionAggregate(this IServiceCollection services)
            => services
                .AddScoped<ISolutionWriteRepository, SolutionWriteRepository>()
                .AddScoped<ISolutionReadRepository, SolutionReadRepository>();
    }
}
