using Microsoft.Extensions.DependencyInjection;
using SolTake.MediaMetadataService.Application;

namespace SolTake.MediaMetadataService.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services) =>
            services
                .AddSingleton<IBlobService,LocalBlobService>()
                .AddScoped<IDimentionCalculator,DimentionCalculator>();

    }
}
