using Microsoft.Extensions.DependencyInjection;
using SolTake.NsfwDetector.Application;

namespace SolTake.NsfwDetector.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddNsfwDetectorInfrastructureServices(this IServiceCollection services)
            => services
                .AddSingleton<VideoFrameExtractor>()
                .AddSingleton<ImageFrameExtractor>()
                .AddSingleton<ImageToBase64Convertor>()
                .AddSingleton<NsfwResultToNsfsCategories>()
                .AddSingleton<NsfwClient>()
                .AddSingleton<IInternalNsfwDetector, OpenAINsfwDetector>()
                .AddSingleton<INsfwDetector, NsfwDetector>()
                .AddSingleton<IBlobService,LocalBlobService>();
    }
}
