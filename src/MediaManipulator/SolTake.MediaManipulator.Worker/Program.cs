using MassTransit;
using SolTake.MediaManipulator.Application;
using SolTake.MediaManipulator.Infrastructure;
using SolTake.MediaManipulator.Worker;

var builder = Host.CreateApplicationBuilder(args);

FFmpegConfigration.Configure();

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
            x.AddConsumer<ManipulateMedia>();
        }
    )
    .AddApplicationServices()
    .AddInfrastructureServices();

var host = builder.Build();
host.Run();
