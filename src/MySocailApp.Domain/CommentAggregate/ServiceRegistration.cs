using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.CommentAggregate.DomainServices;

namespace MySocailApp.Domain.CommentAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddCommentAggregateServices(this IServiceCollection services)
            => services
                .AddScoped<CommentCreatorDomainService>()
                .AddScoped<UserNamesReaderDomainService>();
    }
}
