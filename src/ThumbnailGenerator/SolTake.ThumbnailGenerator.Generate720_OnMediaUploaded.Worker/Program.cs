using MassTransit;
using SolTake.ThumbnailGenerator.Generate720_OnMediaUploaded.Worker;
using SolTake.ThumbnailGenerator.Application;
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
            x.AddConsumer<Generate720>();
        }
    )
    .AddApplicationServices()
    .AddInfrastructureServices();

var host = builder.Build();
host.Run();
