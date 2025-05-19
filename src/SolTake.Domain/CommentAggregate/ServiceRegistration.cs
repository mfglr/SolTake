using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.CommentAggregate.DomainServices;

namespace SolTake.Domain.CommentAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddCommentAggregateServices(this IServiceCollection services)
            => services
                .AddScoped<CommentCreatorDomainService>()
                .AddScoped<UserNamesReaderDomainService>();
    }
}
