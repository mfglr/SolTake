using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.QuestionAggregate.DomainServices;

namespace MySocailApp.Domain.QuestionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionDomainServices(this IServiceCollection services)
            => services
                .AddScoped<QuestionCreatorDomainService>();
    }
}
