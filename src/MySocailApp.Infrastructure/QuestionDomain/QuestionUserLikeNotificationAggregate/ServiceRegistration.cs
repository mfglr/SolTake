using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeNotificationAggregate.Abstracts;

namespace MySocailApp.Infrastructure.QuestionDomain.QuestionUserLikeNotificationAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionUserLikeNotificationInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IQuestionUserLikeNotificationReadRepository, QuestionUserLikeNotificationReadRepository>()
                .AddScoped<IQuestionUserLikeNotificationWriteRepository, QuestionUserLikeNotificationWriteRepository>();
    }
}
