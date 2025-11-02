using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.MediaService.Application.UseCases.AddThumbnail;
using SolTake.MediaService.Application.UseCases.Create;
using SolTake.MediaService.Application.UseCases.SetDimention;
using SolTake.MediaService.Application.UseCases.SetNsfwScores;
using SolTake.MediaService.Application.UseCases.SetTranscodedBlobName;

namespace SolTake.MediaService.Application
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services) =>
            services
                .AddMediator(cfg =>
                {
                    cfg.AddConsumer<CreateHandler>();
                    cfg.AddConsumer<SetDimentionHandler>();
                    cfg.AddConsumer<SetNsfwScoresHandler>();
                    cfg.AddConsumer<SetTranscodedBlobNameHandler>();
                    cfg.AddConsumer<AddThumbnailHandler>();
                });
    }
}
