using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.ThumbnailGenerator.Application.UseCases.CalculateMediaAspectRatios;
using SolTake.ThumbnailGenerator.Application.UseCases.GenerateThumbnail;

namespace SolTake.ThumbnailGenerator.Application
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services) =>
            services
                .AddMediator(cfg =>
                {
                    cfg.AddConsumer<GenerateThumbnailHandler>();
                    cfg.AddConsumer<CalculateMediaAspectRatiosHandler>();
                });
    }
}
