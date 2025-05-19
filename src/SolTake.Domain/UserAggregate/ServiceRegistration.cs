using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserAggregate.DomainServices;

namespace MySocailApp.Domain.UserAggregate
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
