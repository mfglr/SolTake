using Microsoft.Extensions.DependencyInjection;
using SolTake.VideoTranscodingService.Application;

namespace SolTake.VideoTranscodingService.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services) =>
            services
                .AddSingleton<IBlobService, LocalBlobService>()
                .AddSingleton<IVideoTranscoder, VideoTranscoder>();
    }
}
