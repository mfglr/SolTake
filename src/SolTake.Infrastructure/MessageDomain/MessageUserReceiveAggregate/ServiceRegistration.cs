using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.MessageUserReceiveAggregate.Abstracts;

namespace SolTake.Infrastructure.MessageDomain.MessageUserReceiveAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageUserReceiveAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IMessageUserReceiveWriteRepository, MessageUserReceiveWriteRepository>()
                .AddScoped<IMessageUserReceiveReadRepository,MessageUserReceiveReadRepository>();
    }
}
