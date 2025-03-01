using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserDomain.FollowAggregate.Abstracts;

namespace MySocailApp.Infrastructure.UserDomain.FollowAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddFollowAggregate(this IServiceCollection services)
            => services
                .AddScoped<IFollowWriteRepository, FollowWriteRepository>()
                .AddScoped<IFollowReadRepository, FollowReadRepository>();
    }
}
