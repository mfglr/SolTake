using Microsoft.Extensions.DependencyInjection;
using SolTake.Infrastructure.MessageDomain.MessageAggregate;
using SolTake.Infrastructure.MessageDomain.MessageConnectionAggregate;
using SolTake.Infrastructure.MessageDomain.MessageUserReceiveAggregate;
using SolTake.Infrastructure.MessageDomain.MessageUserRemoveAggregate;
using SolTake.Infrastructure.MessageDomain.MessageUserViewAggregate;

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
