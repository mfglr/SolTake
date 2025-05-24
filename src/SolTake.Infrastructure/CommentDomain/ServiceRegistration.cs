using Microsoft.Extensions.DependencyInjection;
using SolTake.Infrastructure.CommentDomain.CommentAggregate;
using SolTake.Infrastructure.CommentDomain.CommentUserLikeAggregate;

namespace SolTake.Infrastructure.CommentDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddCommentDomainInfrastructureService(this IServiceCollection services)
            => services
                .AddCommentUserLikeAggregate()
                .AddCommentAggregate();

    }
}
