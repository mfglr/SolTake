using MassTransit;
using SolTake.MediaMetadataService.Infrastructure;
using SolTake.MediaMetadataService.Workers;
using SolTake.MediaMetadataService.Application;

var builder = Host.CreateApplicationBuilder(args);

FFmpegConfigration.Configure();

builder.Services
    .AddMassTransit(
        x =>
        {
            x.AddConsumer<CalculateDimention>();
            x.UsingRabbitMq((context, cfg) =>
            {
                cfg.Host("localhost", "/", h =>
                {
                    h.Username("guest");
                    h.Password("guest");
                });
                cfg.ConfigureEndpoints(context);
            });
        }
    )
    .AddApplicationServices()
    .AddInfrastructureServices();

var host = builder.Build();
host.Run();
