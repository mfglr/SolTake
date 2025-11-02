using MassTransit;
using SolTake.NsfwDetector.Application;
using SolTake.NsfwDetector.Infrastructure;
using SolTake.NsfwDetector.Infrastructure.Exceptions;
using SolTake.NsfwDetector.Workers;

var builder = Host.CreateApplicationBuilder(args);

FFmpegConfigration.Configure();

builder.Services
    .AddMassTransit(
        bc =>
        {
            bc.AddConsumer<CalculateMediaNsfwScore>();
            bc.AddConsumer<CalculateQuestionContentNsfwScores>();
            bc.AddConsumer<CalculateTopicsNsfwScores>();

            bc.UsingRabbitMq((context, cfg) =>
            {
                cfg.Host("localhost", "/", h =>
                {
                    h.Password("guest");
                    h.Username("guest");
                });

                cfg.ReceiveEndpoint("CalculateMediaNsfwScore", e =>
                {
                    e.UseMessageRetry(r =>
                    {
                        r.Interval(5, 1000);
                        r.Handle<NsfwDetectorException>();
                    });
                    e.ConfigureConsumer<CalculateMediaNsfwScore>(context);
                });

                cfg.ReceiveEndpoint("CalculateQuestionContentNsfwScores", e =>
                {
                    e.UseMessageRetry(r =>
                    {
                        r.Interval(5, 1000);
                        r.Handle<NsfwDetectorException>();
                    });
                    e.ConfigureConsumer<CalculateQuestionContentNsfwScores>(context);
                });

                cfg.ReceiveEndpoint("CalculateTopicsNsfwScores", e =>
                {
                    e.UseMessageRetry(r =>
                    {
                        r.Interval(5, 1000);
                        r.Handle<NsfwDetectorException>();
                    });
                    e.ConfigureConsumer<CalculateTopicsNsfwScores>(context);
                });
            });
        }
    )
    .AddApplicationServices()
    .AddInfrastructureServices();

var host = builder.Build();
host.Run();
