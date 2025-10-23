using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.ThumbnailGenerator.Application.ApplicationServices.GenerateThumbnail;

namespace SolTake.ThumbnailGenerator.Application
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services) =>
            services
                .AddMediator(cfg =>
                {
                    cfg.AddConsumer<GenerateThumbnailHandler>();
                });
    }
}
