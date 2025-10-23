using Microsoft.Extensions.DependencyInjection;
using SolTake.BlobService.Application;

namespace SolTake.BlobService.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddBlobInfrastructureServices(this IServiceCollection services) =>
            services
                .AddSingleton<PathFinder>()
                .AddSingleton<UniqNameGenerator>()
                .AddSingleton<IContainerService, LocalContainerService>()
                .AddSingleton<IBlobService, LocalBlobService>();

    }
}
