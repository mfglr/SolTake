using Microsoft.Extensions.DependencyInjection;
using SolTake.ThumbnailGenerator.Application;

namespace SolTake.ThumbnailGenerator.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services) =>
            services
                .AddSingleton<PathFinder>()
                .AddSingleton<UniqNameGenerator>()
                .AddSingleton<IBlobService,LocalBlobService>()
                .AddScoped<ITempDirectoryManager, TempDirectoryManager>()
                .AddScoped<IThumbnailGenerator, ThumbnailGenerator>()
                .AddScoped<IDimentionCalculator,DimentionCalculator>();

    }
}
