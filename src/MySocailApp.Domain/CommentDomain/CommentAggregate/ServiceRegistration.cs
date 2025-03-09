using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.CommentDomain.CommentAggregate.DomainServices;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddCommentDomainServices(this IServiceCollection services)
            => services
                .AddScoped<CommentCreatorDomainService>()
                .AddScoped<UserNamesReaderDomainService>();
    }
}
