using MassTransit;
using SolTake.QuestionService.Application;
using SolTake.QuestionService.Infrastructure;
using SolTake.QuestionService.OnMediaNsfwCalculated.Worker;

var builder = Host.CreateApplicationBuilder(args);

DbConfiguration.Configure();

builder.Services
    .AddMassTransit(
        x =>
        {
            x.AddConsumer<SetMediaNsfw>();
            x.UsingRabbitMq((context, cfg) =>
            {
                cfg.Host("localhost", "/", h =>
                {
                    h.Username("guest");
                    h.Password("guest");
                });

                cfg.ReceiveEndpoint("SetMediaNsfw", e =>
                {
                    e.UseMessageRetry(r =>
                    {
                        r.Immediate(4);
                        r.Handle<SolTake.QuestionService.Infrastructure.ConcurrencyException>();
                    });
                    e.ConfigureConsumer<SetMediaNsfw>(context);
                });
            });
        }
    )
    .AddQuestionApplicationServices()
    .AddQuestionInfrastructureServices(builder.Configuration);

var host = builder.Build();
host.Run();
