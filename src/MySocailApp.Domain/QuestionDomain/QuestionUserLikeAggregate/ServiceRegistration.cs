using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainServices;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionUserLikeDomainServices(this IServiceCollection services)
            => services
                .AddScoped<QuestionUserLikeCreatorDomainService>();
    }
}
