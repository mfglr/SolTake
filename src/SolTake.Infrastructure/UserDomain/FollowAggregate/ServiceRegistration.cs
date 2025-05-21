using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.UserUserFollowAggregate.Abstracts;

namespace MySocailApp.Infrastructure.UserDomain.FollowAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddFollowAggregate(this IServiceCollection services)
            => services
                .AddScoped<IUserUserFollowWriteRepository, FollowWriteRepository>()
                .AddScoped<IUserUserFollowReadRepository, FollowReadRepository>();
    }
}
