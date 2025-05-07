using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.AIModelAggregate.Abstracts;
using MySocailApp.Domain.BalanceAggregate.Abstracts;
using MySocailApp.Domain.TransactionAggregate.Abstracts;

namespace MySocailApp.Infrastructure.Repositories
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
