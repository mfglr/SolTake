using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.UserUserConversationAggregate.DomainServices;

namespace SolTake.Domain.UserUserConversationAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserConversationDomainServices(this IServiceCollection services)
            => services
                .AddScoped<UserUserConversationCreatorDomainService>();
    }
}
