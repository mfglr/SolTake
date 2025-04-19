using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserAggregate.Abstracts;

namespace MySocailApp.Infrastructure.UserDomain.UserAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserAggregate(this IServiceCollection services)
            => services
                .AddScoped<IUserReadRepository, UserReadRepository>()
                .AddScoped<IUserWriteRepository, UserWriteRepository>();
    }
}
