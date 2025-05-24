using Microsoft.Extensions.DependencyInjection;
using SolTake.Infrastructure.UserDomain.FollowAggregate;
using SolTake.Infrastructure.UserDomain.PrivacyPolicyAggreagate;
using SolTake.Infrastructure.UserDomain.TermsOfUseAggregate;
using SolTake.Infrastructure.UserDomain.UserAggregate;
using SolTake.Infrastructure.UserDomain.UserUserBlockeAggregate;
using SolTake.Infrastructure.UserDomain.UserUserConversationAggregate;
using SolTake.Infrastructure.UserDomain.UserUserSearchAggregate;

namespace SolTake.Infrastructure.UserDomain
{
    public static class ServiceRegisration
    {
        public static IServiceCollection AddUserDomainInfrastructureServices(this IServiceCollection services)
            => services
                .AddFollowAggregate()
                .AddPrivacyPolicyAggregate()
                .AddTermsOfUseAggregate()
                .AddUserAggregate()
                .AddUserUserSearchAggregate()
                .AddUserUserBlockAggregateInfrastructureServices()
                .AddUserUserConversationAggregateInfrastructureServices();
    }
}
