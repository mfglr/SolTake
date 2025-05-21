using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Abstracts;

namespace MySocailApp.Infrastructure.QuestionDomain.QuestionUserSaveAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionUserSaveAggregate(this IServiceCollection services)
            => services
                .AddScoped<IQuestionUserSaveReadRepository, QuestionUserSaveReadRepository>()
                .AddScoped<IQuestionUserSaveWriteRepository, QuestionUserSaveWriteRepository>();
    }
}
