using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.CommentAggregate.Abstracts;

namespace MySocailApp.Infrastructure.CommentDomain.CommentAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddCommentAggregate(this IServiceCollection services)
            => services
                .AddScoped<ICommentWriteRepository, CommentWriteRepository>()
                .AddScoped<ICommentReadRepository, CommentReadRepository>();
    }
}
