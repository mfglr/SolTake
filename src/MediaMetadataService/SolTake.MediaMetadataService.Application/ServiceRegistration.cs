using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.MediaMetadataService.Application.UseCases.CalculateDimention;

namespace SolTake.MediaMetadataService.Application
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services) =>
            services
                .AddMediator(cfg =>
                {
                    cfg.AddConsumer<CalculateDimentionHandler>();
                });
    }
}
