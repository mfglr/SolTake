using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Abstracts;

namespace MySocailApp.Infrastructure.MessageDomain.MessageUserRemoveAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageUserRemoveAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IMessageUserRemoveReadRepository, MessageUserRemoveReadRepository>()
                .AddScoped<IMessageUserRemoveWriteRepository, MessageUserRemoveWriteRepository>();
    }
}
