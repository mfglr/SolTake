using AccountDomain.AccountAggregate.DomainServices;
using Microsoft.Extensions.DependencyInjection;

namespace AccountDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddAccountDomain(this IServiceCollection services)
            => services
                .AddScoped<AccessTokenSetterDomainService>()
                .AddScoped<AuthenticatorDomainService>()
                .AddScoped<RefreshTokenSetterDomainService>()
                .AddScoped<RefreshTokenValidatorDomainService>()
                .AddScoped<AccountCreatorDomainService>()
                .AddScoped<EmailUpdaterDomainService>()
                .AddScoped<FaceBookTokenValidatorDomainService>()
                .AddScoped<GoogleTokenValidatorDomainService>()
                .AddScoped<UserNameUpdaterDomainService>()
                .AddScoped<UserNameUpdaterDomainService>();
    }
}
