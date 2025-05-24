using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.MessageAggregate.Abstracts;

namespace SolTake.Infrastructure.MessageDomain.MessageAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageAggregateInfrastructreServices(this IServiceCollection services)
            => services
                .AddScoped<IMessageWriteRepository, MessageWriteRepository>()
                .AddScoped<IMessageReadRepository, MessageReadRepository>();
    }
}
