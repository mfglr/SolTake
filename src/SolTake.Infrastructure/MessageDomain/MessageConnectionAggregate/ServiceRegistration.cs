using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Infrastructure.MessageDomain.UserConnectionAggregate;
using SolTake.Domain.MessageConnectionAggregate.Abstracts;

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
