using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.MessageUserRemoveAggregate.Abstracts;

namespace SolTake.Infrastructure.MessageDomain.MessageUserRemoveAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageUserRemoveAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IMessageUserRemoveReadRepository, MessageUserRemoveReadRepository>()
                .AddScoped<IMessageUserRemoveWriteRepository, MessageUserRemoveWriteRepository>();
    }
}
