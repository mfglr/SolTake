using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Infrastructure.UserDomain.FollowAggregate;
using MySocailApp.Infrastructure.UserDomain.PrivacyPolicyAggreagate;
using MySocailApp.Infrastructure.UserDomain.TermsOfUseAggregate;
using MySocailApp.Infrastructure.UserDomain.UserAggregate;

namespace MySocailApp.Infrastructure.UserDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserDomainInfrastructureServices(this IServiceCollection services)
            => services
                .AddFollowAggregate()
                .AddPrivacyPolicyAggregate()
                .AddTermsOfUseAggregate()
                .AddUserAggregate();
    }
}
