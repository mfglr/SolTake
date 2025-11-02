using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.VideoTranscodingService.Application.TempManager;
using SolTake.VideoTranscodingService.Application.UseCases.Transcode;

namespace SolTake.VideoTranscodingService.Application
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services) =>
            services
                .AddSingleton<UniqNameGenerator>()
                .AddSingleton<PathFinder>()
                .AddScoped<TempDirectoryManager>()
                .AddMediator(cfg =>
                {
                    cfg.AddConsumer<TranscodeHandler>();
                });
    }
}
