using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.CommentUserLikeAggregate.DomainServices;

namespace MySocailApp.Domain.CommentUserLikeAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddCommentUserLikeAggregateServices(this IServiceCollection services) =>
            services
                .AddScoped<CommentUserLikeCreatorDomainService>();
    }
}
