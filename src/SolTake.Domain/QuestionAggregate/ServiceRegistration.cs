using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.QuestionAggregate.DomainServices;

namespace SolTake.Domain.QuestionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionDomainServices(this IServiceCollection services)
            => services
                .AddScoped<QuestionCreatorDomainService>();
    }
}
