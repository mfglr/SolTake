using Microsoft.Extensions.DependencyInjection;
using SolTake.Infrastructure.MessageDomain.UserConnectionAggregate;
using SolTake.Domain.MessageConnectionAggregate.Abstracts;

namespace SolTake.Infrastructure.MessageDomain.MessageConnectionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageConnectionAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IMessageConnectionReadRepository, MessageConnectionReadRepository>()
                .AddScoped<IMessageConnectionWriteRepository, MessageConnectionWriteRepository>();
    }
}
