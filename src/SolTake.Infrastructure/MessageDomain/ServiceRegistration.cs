using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Infrastructure.MessageDomain.MessageAggregate;
using MySocailApp.Infrastructure.MessageDomain.MessageConnectionAggregate;
using SolTake.Infrastructure.MessageDomain.MessageUserReceiveAggregate;
using MySocailApp.Infrastructure.MessageDomain.MessageUserRemoveAggregate;
using MySocailApp.Infrastructure.MessageDomain.MessageUserViewAggregate;

namespace MySocailApp.Infrastructure.MessageDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageDomainInfrastructureServices(this IServiceCollection services)
            => services
                .AddMessageAggregateInfrastructreServices()
                .AddMessageConnectionAggregateInfrastructureServices()
                .AddMessageUserReceiveAggregateInfrastructureServices()
                .AddMessageUserRemoveAggregateInfrastructureServices()
                .AddMessageUserViewAggregateInfrastructureServices();
    }
}
