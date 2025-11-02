using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.NsfwDetector.Application.UseCases.CalculateMediaNsfwScore;
using SolTake.NsfwDetector.Application.UseCases.CalculateTextNsfwScore;

namespace SolTake.NsfwDetector.Application
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services) =>
            services
                .AddSingleton<UniqNameGenerator>()
                .AddSingleton<PathFinder>()
                .AddScoped<TempDirectoryManager>()
                .AddMediator(cfg => {
                    cfg.AddConsumer<CalculateMediaNsfwScoreHandler>();
                    cfg.AddConsumer<CalculateTextNsfwScoreHandler>();
                });

    }
}
