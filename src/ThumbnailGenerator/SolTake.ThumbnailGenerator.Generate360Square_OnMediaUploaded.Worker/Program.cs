using MassTransit;
using SolTake.ThumbnailGenerator.Application;
using SolTake.ThumbnailGenerator.Generate360Square_OnMediaUploaded.Worker;
using SolTake.ThumbnailGenerator.Infrastructure;

var builder = Host.CreateApplicationBuilder(args);

builder.Services
    .AddMassTransit(
        x =>
        {
            x.UsingRabbitMq((context, cfg) =>
            {
                cfg.Host("localhost", "/", h =>
                {
                    h.Username("guest");
                    h.Password("guest");
                });
                cfg.ConfigureEndpoints(context);
            });
            x.AddConsumer<Generate360Square>();
        }
    )
    .AddApplicationServices()
    .AddInfrastructureServices();

var host = builder.Build();
host.Run();
