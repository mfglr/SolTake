using MassTransit;
using SolTake.NsfwDetector.Application;
using SolTake.NsfwDetector.Infrastructure;
using SolTake.NsfwDetector.Worker.OnMediaUploaded;

var builder = Host.CreateApplicationBuilder(args);

FFmpegConfigration.Configure();

builder.Services
    .AddMassTransit(
        x =>
        {
            x.AddConsumer<CalculateNsfwScores>();
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
    .AddNsfwDetectorInfrastructureServices();

var host = builder.Build();
host.Run();
