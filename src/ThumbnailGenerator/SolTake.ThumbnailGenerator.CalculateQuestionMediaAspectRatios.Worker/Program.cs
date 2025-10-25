using MassTransit;
using SolTake.ThumbnailGenerator.CalculateQuestionMediaAspectRatios.Worker;
using SolTake.ThumbnailGenerator.Application;
using SolTake.ThumbnailGenerator.Infrastructure;

var builder = Host.CreateApplicationBuilder(args);

FFmpegConfigration.Configure();

builder.Services
    .AddMassTransit(
        x =>
        {
            x.AddConsumer<CalculateQuestionMediaDimentions>();
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
