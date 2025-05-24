using Microsoft.Extensions.DependencyInjection;
using SolTake.Infrastructure.QuestionDomain.QuestionAggregate;
using SolTake.Infrastructure.QuestionDomain.QuestionUserLikeAggregate;
using SolTake.Infrastructure.QuestionDomain.QuestionUserSaveAggregate;

namespace MySocailApp.Infrastructure.QuestionDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionDomainInfrastructureServices(this IServiceCollection services)
            => services
                .AddQuestionUserLikeAggregateInfrastructureServices()
                .AddQuestionAggregateInfrastructureServices()
                .AddQuestionUserSaveAggregate();
    }
}
