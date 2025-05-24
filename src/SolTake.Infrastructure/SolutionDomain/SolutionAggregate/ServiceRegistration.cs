using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.SolutionAggregate.Abstracts;

namespace SolTake.Infrastructure.SolutionDomain.SolutionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionAggregate(this IServiceCollection services)
            => services
                .AddScoped<ISolutionWriteRepository, SolutionWriteRepository>()
                .AddScoped<ISolutionReadRepository, SolutionReadRepository>();
    }
}
