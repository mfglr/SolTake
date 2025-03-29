using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.Abstracts;

namespace MySocailApp.Infrastructure.MessageDomain.MessageUserViewAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageUserViewAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IMessageUserViewWriteRepository, MessageUserViewWriteRepository>()
                .AddScoped<IMessageUserViewReadRepository, MessageUserViewReadRepository>();
    }
}
