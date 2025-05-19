using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserUserBlockAggregate.Abstracts;

namespace MySocailApp.Infrastructure.UserDomain.UserUserBlockeAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserBlockAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IUserUserBlockRepository, UserUserBlockRepository>();
    }
}
