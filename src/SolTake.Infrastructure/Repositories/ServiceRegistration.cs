using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.TransactionAggregate.Abstracts;
using SolTake.Domain.AIModelAggregate.Abstracts;
using SolTake.Infrastructure.BalanceAggregate;
using SolTake.Domain.BalanceAggregate.Abstracts;

namespace SolTake.Infrastructure.Repositories
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddRepositories(this IServiceCollection services)
        {
            services
                .AddScoped<IBalanceRepository, BalanceRepository>()
                .AddScoped<ITransactionRepository, TransactionRepository>()
                .AddScoped<IAIModelRepository, AIModelRepository>();

            var repository = services.BuildServiceProvider().GetRequiredService<IAIModelRepository>();
            var models = repository.GetAll();
            var aiModelCacheService = new AIModelCacheService(models);
            return services.AddSingleton<IAIModelCacheService>(aiModelCacheService);
        }
    }
}
