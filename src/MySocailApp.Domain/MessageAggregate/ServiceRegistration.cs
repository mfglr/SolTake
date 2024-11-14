using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageAggregate.DomainServices;

namespace MySocailApp.Domain.MessageAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageDomainServices(this IServiceCollection services)
            => services
                .AddScoped<MessageCreaterDomainService>()
                .AddScoped<MessageRemoverDomainService>();
    }
}
