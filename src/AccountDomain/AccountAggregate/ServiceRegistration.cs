using AccountDomain.AccountAggregate.DomainServices;
using Microsoft.Extensions.DependencyInjection;

namespace AccountDomain.AccountAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddAccountAggregate(this IServiceCollection services)
            => services
                .AddScoped<AccessTokenSetterDomainService>()
                .AddScoped<AuthenticatorDomainService>()
                .AddScoped<RefreshTokenSetterDomainService>()
                .AddScoped<RefreshTokenValidatorDomainService>()
                .AddScoped<AccountCreatorDomainService>()
                .AddScoped<EmailUpdaterDomainService>()
                .AddScoped<GoogleTokenValidatorDomainService>()
                .AddScoped<UserNameUpdaterDomainService>()
                .AddScoped<UserNameUpdaterDomainService>();
    }
}
