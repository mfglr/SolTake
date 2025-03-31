using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Infrastructure.QuestionDomain.QuestionAggregate;
using MySocailApp.Infrastructure.QuestionDomain.QuestionUserLikeAggregate;
using MySocailApp.Infrastructure.QuestionDomain.QuestionUserLikeNotificationAggregate;
using MySocailApp.Infrastructure.QuestionDomain.QuestionUserSaveAggregate;

namespace MySocailApp.Infrastructure.QuestionDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionDomainInfrastructureServices(this IServiceCollection services)
            => services
                .AddQuestionUserLikeAggregateInfrastructureServices()
                .AddQuestionAggregateInfrastructureServices()
                .AddQuestionUserLikeNotificationInfrastructureServices()
                .AddQuestionUserSaveAggregate();
    }
}
