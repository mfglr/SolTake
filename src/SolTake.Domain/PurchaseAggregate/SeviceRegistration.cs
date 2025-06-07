using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.PurchaseAggregate.DomainServices;

namespace SolTake.Domain.PurchaseAggregate
{
    public static class SeviceRegistration
    {
        public static IServiceCollection AddPurchaseAggregateDomainServices(this IServiceCollection services)
            => services
                .AddScoped<PurchaseCreatorDomainService>();

    }
}
