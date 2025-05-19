using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.CommentUserLikeAggregate.DomainServices;

namespace SolTake.Domain.CommentUserLikeAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddCommentUserLikeAggregateServices(this IServiceCollection services) =>
            services
                .AddScoped<CommentUserLikeCreatorDomainService>();
    }
}
