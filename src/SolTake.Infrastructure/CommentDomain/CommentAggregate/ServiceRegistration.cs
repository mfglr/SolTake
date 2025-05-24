using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.CommentAggregate.Abstracts;

namespace SolTake.Infrastructure.CommentDomain.CommentAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddCommentAggregate(this IServiceCollection services)
            => services
                .AddScoped<ICommentWriteRepository, CommentWriteRepository>()
                .AddScoped<ICommentReadRepository, CommentReadRepository>();
    }
}
