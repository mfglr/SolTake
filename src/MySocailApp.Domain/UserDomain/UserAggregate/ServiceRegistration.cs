using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserDomain.UserAggregate.DomainServices;

namespace MySocailApp.Domain.UserDomain.UserAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserAggregate(this IServiceCollection services)
            => services
                .AddScoped<AccessTokenSetterDomainService>()
                .AddScoped<AuthenticatorDomainService>()
                .AddScoped<RefreshTokenSetterDomainService>()
                .AddScoped<RefreshTokenValidatorDomainService>()
                .AddScoped<UserCreatorDomainService>()
                .AddScoped<EmailUpdaterDomainService>()
                .AddScoped<GoogleTokenValidatorDomainService>()
                .AddScoped<UserNameUpdaterDomainService>()
                .AddScoped<UserNameUpdaterDomainService>();
    }
}
