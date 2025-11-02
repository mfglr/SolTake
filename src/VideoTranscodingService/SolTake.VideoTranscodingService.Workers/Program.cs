using MassTransit;
using SolTake.VideoTranscodingService.Application;
using SolTake.VideoTranscodingService.Infrastructure;
using SolTake.VideoTranscodingService.Workers;

var builder = Host.CreateApplicationBuilder(args);

FFmpegConfigration.Configure();

builder.Services
    .AddMassTransit(
        x =>
        {
            x.AddConsumer<Transcode>();
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
