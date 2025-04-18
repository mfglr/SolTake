using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate;
using MySocailApp.Domain.QuestionUserLikeAggregate;

namespace MySocailApp.Domain.QuestionDomain
{
    public static class ServiceCollection
    {
        public static IServiceCollection AddQuestionDomain(this IServiceCollection services)
            => services
                .AddQuestionDomainServices()
                .AddQuestionUserLikeDomainServices();

    }
}
