using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.QuestionService.Application.UseCases.Create;
using SolTake.QuestionService.Application.UseCases.SetContentNsfwScore;
using SolTake.QuestionService.Application.UseCases.SetTopicsNsfwScores;

namespace SolTake.QuestionService.Application
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services) =>
            services
                .AddSingleton<MediaGenerator>()
                .AddSingleton<MediaTypeMapper>()
                .AddMediator(cfg => {
                    cfg.AddConsumer<CreateQuestionHandler>();
                    cfg.AddConsumer<SetContentNsfwScoreHandler>();
                    cfg.AddConsumer<SetTopicsNsfwScoresHandler>();
                });
    }
}
