using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;

namespace MySocailApp.Infrastructure.MessageDomain.MessageAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageAggregateInfrastructreServices(this IServiceCollection services)
            => services
                .AddScoped<IMessageWriteRepository, MessageWriteRepository>()
                .AddScoped<IMessageReadRepository, MessageReadRepository>();
    }
}
