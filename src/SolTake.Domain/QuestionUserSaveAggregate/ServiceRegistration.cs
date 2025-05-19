using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.QuestionUserSaveAggregate.DomainServices;

namespace MySocailApp.Domain.QuestionUserSaveAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionUserSaveDomainServices(this IServiceCollection services)
            => services
                .AddScoped<QuestionUserSaveCreatorDomainService>();
    }
}
