using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.AccountDomain.AccountAggregate.DomainServices;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddAccountDomainServices(this IServiceCollection services)
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
