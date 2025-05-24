using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.MessageUserViewAggregate.Abstracts;

namespace SolTake.Infrastructure.MessageDomain.MessageUserViewAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddMessageUserViewAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IMessageUserViewWriteRepository, MessageUserViewWriteRepository>()
                .AddScoped<IMessageUserViewReadRepository, MessageUserViewReadRepository>();
    }
}
