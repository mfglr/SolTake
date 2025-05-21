using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.UserAggregate.DomainServices;

namespace SolTake.Domain.UserAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserDomainServices(this IServiceCollection services)
            => services
                .AddScoped<AccessTokenSetterDomainService>()
                .AddScoped<AuthenticatorDomainService>()
                .AddScoped<UserCreatorDomainService>()
                .AddScoped<EmailUpdaterDomainService>()
                .AddScoped<GoogleTokenValidatorDomainService>()
                .AddScoped<UserManipulator>();
    }
}
