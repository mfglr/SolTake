using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.BalanceAggregate.Abstracts;
using MySocailApp.Domain.TransactionAggregate.Abstracts;

namespace MySocailApp.Infrastructure.Repositories
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddRepositories(this IServiceCollection services)
            => services
                .AddScoped<IBalanceRepository, BalanceRepository>()
                .AddScoped<ITransactionRepository, TransactionRepository>();
    }
}
