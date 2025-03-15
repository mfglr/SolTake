using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Infrastructure.MessageDomain.MessageAggregate;
using MySocailApp.Infrastructure.MessageDomain.MessageConnectionAggregate;
using MySocailApp.Infrastructure.MessageDomain.MessageUserRemoveAggregate;

namespace MySocailApp.Infrastructure.MessageDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageDomainInfrastructureServices(this IServiceCollection services)
            => services
                .AddMessageAggregateInfrastructreServices()
                .AddMessageConnectionAggregateInfrastructureServices()
                .AddMessageUserRemoveAggregateInfrastructureServices();
    }
}
