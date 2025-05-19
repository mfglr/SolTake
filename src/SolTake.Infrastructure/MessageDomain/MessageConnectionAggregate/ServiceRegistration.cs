using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Infrastructure.MessageDomain.UserConnectionAggregate;

namespace MySocailApp.Infrastructure.MessageDomain.MessageConnectionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageConnectionAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IMessageConnectionReadRepository, MessageConnectionReadRepository>()
                .AddScoped<IMessageConnectionWriteRepository, MessageConnectionWriteRepository>();
    }
}
