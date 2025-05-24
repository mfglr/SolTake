using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.UserAggregate.Abstracts;

namespace SolTake.Infrastructure.UserDomain.UserAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserAggregate(this IServiceCollection services)
            => services
                .AddScoped<IUserReadRepository, UserReadRepository>()
                .AddScoped<IUserWriteRepository, UserWriteRepository>();
    }
}
