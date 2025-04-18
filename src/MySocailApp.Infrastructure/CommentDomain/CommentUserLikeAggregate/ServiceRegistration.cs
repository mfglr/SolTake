using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.CommentUserLikeAggregate.Abstracts;

namespace MySocailApp.Infrastructure.CommentDomain.CommentUserLikeAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddCommentUserLikeAggregate(this IServiceCollection services)
            => services
                .AddScoped<ICommentUserLikeWriteRepository, CommentUserLikeWriteRepository>()
                .AddScoped<ICommentUserLikeReadRepository, CommentUserLikeReadRepository>();
    }
}
