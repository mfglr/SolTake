using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.UserDomain.UserUserSearchAggregate.Abstracts;

namespace MySocailApp.Infrastructure.UserDomain.UserUserSearchAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserSearchAggregate(this IServiceCollection services)
            => services
                .AddScoped<IUserUserSearchWriteRepository, UserUserSearchWriteRepository>();
    }
}
