using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.MessageDomain.MessageAggregate;

namespace MySocailApp.Domain.MessageDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageDomain(this IServiceCollection services)
            => services
                .AddMessageDomainServices();
    }
}
