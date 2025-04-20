using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserUserConversationAggregate.Abstracts;

namespace MySocailApp.Infrastructure.UserDomain.UserUserConversationAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserConversationAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IUserUserConversationWriteRepository, UserUserConversationWriteRepository>();
    }
}
