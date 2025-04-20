using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserUserConversationAggregate.DomainServices;

namespace MySocailApp.Domain.UserUserConversationAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserConversationDomainServices(this IServiceCollection services)
            => services
                .AddScoped<UserUserConversationCreatorDomainService>();
    }
}
