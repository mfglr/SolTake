using MassTransit;
using SolTake.ThumbnailGenerator.Application;
using SolTake.ThumbnailGenerator.Infrastructure;
using SolTake.ThumbnailGenerator.Workers;

var builder = Host.CreateApplicationBuilder(args);

FFmpegConfigration.Configure();

builder.Services
    .AddMassTransit(
        x =>
        {
            x.AddConsumer<GenerateP720>();
            x.AddConsumer<GenerateS360>();
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
