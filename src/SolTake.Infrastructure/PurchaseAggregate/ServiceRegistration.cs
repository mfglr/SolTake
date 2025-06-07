using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.PurchaseAggregate.Abstracts;

namespace SolTake.Infrastructure.PurchaseAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddPurchaseAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IPurchaseRepository, PurchaseRepository>()
                .AddScoped<IPurchaseValidator, PurchaseValidator>();

    }
}
