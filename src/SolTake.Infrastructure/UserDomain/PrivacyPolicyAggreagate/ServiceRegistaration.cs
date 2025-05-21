using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.PrivacyPolicyAggregate.Abstracts;

namespace MySocailApp.Infrastructure.UserDomain.PrivacyPolicyAggreagate
{
    public static class ServiceRegistaration
    {
        public static IServiceCollection AddPrivacyPolicyAggregate(this IServiceCollection services)
            => services
                .AddScoped<IPrivacyPolicyReadRepository, PolicyReadRepository>()
                .AddScoped<IPrivacyPolicyWriteRepository, PolicyWriteRepository>();
    }
}
