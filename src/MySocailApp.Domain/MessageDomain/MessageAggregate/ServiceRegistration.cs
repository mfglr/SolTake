using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainServices;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageDomainServices(this IServiceCollection services)
            => services
                .AddScoped<MessageCreaterDomainService>()
                .AddScoped<MessageRemoverDomainService>();
    }
}
