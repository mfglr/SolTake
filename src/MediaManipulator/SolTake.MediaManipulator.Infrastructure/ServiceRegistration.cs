using Microsoft.Extensions.DependencyInjection;
using SolTake.MediaManipulator.Application;

namespace SolTake.MediaManipulator.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services) =>
            services
                .AddSingleton<IBlobService, LocalBlobService>()
                .AddSingleton<IVideoManipulator, VideoManipulator>();
    }
}
