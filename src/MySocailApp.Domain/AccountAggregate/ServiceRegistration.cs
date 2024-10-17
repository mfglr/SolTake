using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.AccountAggregate.DomainServices;

namespace MySocailApp.Domain.AccountAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddAccountDomainServices(this IServiceCollection services)
        => services
            .AddScoped<AccountCreatorByThirdPartyDomainService>()
            .AddScoped<AccountCreatorDomainService>()
            .AddScoped<EmailUpdaterDomainService>()
            .AddScoped<EmailVerifierDomainService>()
            .AddScoped<FaceBookTokenValidatorDomainService>()
            .AddScoped<GoogleTokenValidatorDomainService>()
            .AddScoped<PasswordAuthenticatorDomainService>()
            .AddScoped<PasswordUpdaterDomainService>()
            .AddScoped<RefreshTokenAuthenticatorDomainService>()
            .AddScoped<ThirdPartyAuthenticatorDomainService>()
            .AddScoped<UserNameUpdaterDomainService>()
            .AddScoped<UserNameUpdaterDomainService>();
    }
}
