using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Infrastructure.CommentDomain.CommentAggregate;
using MySocailApp.Infrastructure.CommentDomain.CommentUserLikeAggregate;

namespace MySocailApp.Infrastructure.CommentDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddCommentDomainInfrastructureService(this IServiceCollection services)
            => services
                .AddCommentUserLikeAggregate()
                .AddCommentAggregate();

    }
}
