using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Infrastructure.UserDomain.FollowAggregate;
using MySocailApp.Infrastructure.UserDomain.PrivacyPolicyAggreagate;
using MySocailApp.Infrastructure.UserDomain.TermsOfUseAggregate;
using MySocailApp.Infrastructure.UserDomain.UserAggregate;
using MySocailApp.Infrastructure.UserDomain.UserUserBlockeAggregate;
using MySocailApp.Infrastructure.UserDomain.UserUserSearchAggregate;

namespace MySocailApp.Infrastructure.UserDomain
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
                .AddUserUserBlockAggregateInfrastructureServices();
    }
}
