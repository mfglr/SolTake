using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.QuestionService.Application.UseCases.Create;
using SolTake.QuestionService.Application.UseCases.SetMediaDimentions;
using SolTake.QuestionService.Application.UseCases.SetMediaNsfwScore;
using SolTake.QuestionService.Application.UseCases.SetQuestionNsfwScores;

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
                    cfg.AddConsumer<SetMediaNsfwScoreHandler>();
                    cfg.AddConsumer<SetQuestionNsfwScoresHandler>();
                    cfg.AddConsumer<SetMediaDimentionsHandler>();
                });
    }
}
