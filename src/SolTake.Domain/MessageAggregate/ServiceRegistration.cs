using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.MessageAggregate.DomainServices;

namespace SolTake.Domain.MessageAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageDomainServices(this IServiceCollection services)
            => services
                .AddScoped<MessageCreatorDomainService>();
    }
}
