using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.BalanceAggregate.Abstracts;

namespace MySocailApp.Infrastructure.Repositories
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddRepositories(this IServiceCollection services)
            => services
                .AddScoped<IBalanceRepository, BalanceRepository>();
    }
}
