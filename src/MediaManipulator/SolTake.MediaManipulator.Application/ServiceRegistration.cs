using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.MediaManipulator.Application.ApplicationServices.ManipulateVideo;
using SolTake.MediaManipulator.Application.TempManager;

namespace SolTake.MediaManipulator.Application
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
                    cfg.AddConsumer<ManipulateVideoHandler>();
                });
    }
}
