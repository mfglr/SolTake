using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.DomainServices;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionDomainServices(this IServiceCollection services)
            => services
                .AddScoped<QuestionCreatorDomainService>();
    }
}
