using MassTransit;
using SolTake.NsfwDetector.CalculateNsfw_OnQuestionCreated.Worker;
using SolTake.NsfwDetector.Application;
using SolTake.NsfwDetector.Infrastructure;

var builder = Host.CreateApplicationBuilder(args);

FFmpegConfigration.Configure();

builder.Services
    .AddMassTransit(
        x =>
        {
            x.AddConsumer<CalculateQuestionNsfwScore>();
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
