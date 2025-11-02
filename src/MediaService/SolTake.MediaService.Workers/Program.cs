using MassTransit;
using SolTake.MediaService.Application;
using SolTake.MediaService.Infrastructure;
using SolTake.MediaService.Workers;

var builder = Host.CreateApplicationBuilder(args);
DbConfiguration.Configure();

builder.Services
    .AddMassTransit(
        x =>
        {
            x.AddConsumer<CreateMedia>();
            x.AddConsumer<SetDimention>();
            x.AddConsumer<SetNsfwScores>();
            x.AddConsumer<SetTranscodedBlobName>();
            x.AddConsumer<AddThumbnail>();

            x.UsingRabbitMq((context, cfg) =>
            {
                cfg.Host("localhost", "/", h =>
                {
                    h.Username("guest");
                    h.Password("guest");
                });

                var retryLimit = 4;

                cfg.ReceiveEndpoint("SetDimention", e =>
                {
                    e.UseMessageRetry(cfg =>
                    {
                        cfg.Immediate(retryLimit);
                        cfg.Handle<SolTake.MediaService.Infrastructure.ConcurrencyException>();
                    });
                    e.ConfigureConsumer<SetDimention>(context);
                });

                cfg.ReceiveEndpoint("SetNsfwScores", e =>
                {
                    e.UseMessageRetry(cfg =>
                    {
                        cfg.Immediate(retryLimit);
                        cfg.Handle<SolTake.MediaService.Infrastructure.ConcurrencyException>();
                    });
                    e.ConfigureConsumer<SetNsfwScores>(context);
                });

                cfg.ReceiveEndpoint("SetTranscodedBlobName", e =>
                {
                    e.UseMessageRetry(cfg =>
                    {
                        cfg.Immediate(retryLimit);
                        cfg.Handle<SolTake.MediaService.Infrastructure.ConcurrencyException>();
                    });
                    e.ConfigureConsumer<SetTranscodedBlobName>(context);
                });

                cfg.ReceiveEndpoint("AddThumbnail", e =>
                {
                    e.UseMessageRetry(cfg =>
                    {
                        cfg.Immediate(retryLimit);
                        cfg.Handle<SolTake.MediaService.Infrastructure.ConcurrencyException>();
                    });
                    e.ConfigureConsumer<AddThumbnail>(context);
                });

                cfg.ConfigureEndpoints(context);
            });
        }
    )
    .AddApplicationServices()
    .AddInfrastructureServices();

var host = builder.Build();
host.Run();
