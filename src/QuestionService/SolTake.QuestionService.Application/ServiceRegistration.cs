using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.QuestionService.Application.ApplicationServices.Create;
using SolTake.QuestionService.Application.ApplicationServices.SetMediaNsfwScore;

namespace SolTake.QuestionService.Application
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionApplicationServices(this IServiceCollection services) =>
            services
                .AddSingleton<MediaGenerator>()
                .AddSingleton<MediaTypeMapper>()
                .AddMediator(cfg => {
                    cfg.AddConsumer<CreateQuestionHandler>();
                    cfg.AddConsumer<SetMediaNsfwScoreHandler>();
                });
    }
}
