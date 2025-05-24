using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.UserUserSearchAggregate.Abstracts;

namespace SolTake.Infrastructure.UserDomain.UserUserSearchAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserSearchAggregate(this IServiceCollection services)
            => services
                .AddScoped<IUserUserSearchWriteRepository, UserUserSearchWriteRepository>();
    }
}
