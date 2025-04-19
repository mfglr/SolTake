using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.MessageUserReceiveAggregate.Abstracts;

namespace MySocailApp.Infrastructure.MessageDomain.MessageUserReceiveAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageUserReceiveAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IMessageUserReceiveWriteRepository, MessageUserReceiveWriteRepository>()
                .AddScoped<IMessageUserReceiveReadRepository,MessageUserReceiveReadRepository>();
    }
}
