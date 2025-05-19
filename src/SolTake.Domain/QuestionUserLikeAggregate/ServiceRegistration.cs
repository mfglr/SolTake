using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.QuestionUserLikeAggregate.DomainServices;

namespace MySocailApp.Domain.QuestionUserLikeAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionUserLikeDomainServices(this IServiceCollection services)
            => services
                .AddScoped<QuestionUserLikeCreatorDomainService>();
    }
}
