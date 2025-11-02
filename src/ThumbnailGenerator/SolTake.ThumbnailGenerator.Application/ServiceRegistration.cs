using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.ThumbnailGenerator.Application.TempManager;
using SolTake.ThumbnailGenerator.Application.UseCases.GenerateThumbnail;

namespace SolTake.ThumbnailGenerator.Application
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
                    cfg.AddConsumer<GenerateThumbnailHandler>();
                });
    }
}
