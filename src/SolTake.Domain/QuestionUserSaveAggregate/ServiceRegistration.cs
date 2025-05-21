using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.QuestionUserSaveAggregate.DomainServices;

namespace SolTake.Domain.QuestionUserSaveAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionUserSaveDomainServices(this IServiceCollection services)
            => services
                .AddScoped<QuestionUserSaveCreatorDomainService>();
    }
}
