using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.SolutionUserSaveAggregate.Abstracts;

namespace SolTake.Infrastructure.SolutionDomain.SolutionUserSaveAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionUserSaveAggregate(this IServiceCollection services)
            => services
                .AddScoped<ISolutionUserSaveWriteRepository, SolutionUserSaveWriteRepository>()
                .AddScoped<ISolutionUserSaveReadRepository, SolutionUserSaveReadRepository>();
    }
}
