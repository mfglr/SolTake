using AccountDomain.AccountAggregate;
using Microsoft.Extensions.DependencyInjection;

namespace AccountDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddAccountDomain(this IServiceCollection services)
            => services
                .AddAccountAggregate();
    }
}
