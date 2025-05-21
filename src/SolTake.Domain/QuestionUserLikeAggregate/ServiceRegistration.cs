using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.QuestionUserLikeAggregate.DomainServices;

namespace SolTake.Domain.QuestionUserLikeAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionUserLikeDomainServices(this IServiceCollection services)
            => services
                .AddScoped<QuestionUserLikeCreatorDomainService>();
    }
}
