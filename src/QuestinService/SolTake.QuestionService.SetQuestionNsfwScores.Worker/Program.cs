using MassTransit;
using SolTake.QuestionService.Application;
using SolTake.QuestionService.Infrastructure;
using SolTake.QuestionService.SetQuestionNsfwScores.Worker;

var builder = Host.CreateApplicationBuilder(args);

DbConfiguration.Configure();

builder.Services
    .AddMassTransit(
        x =>
        {
            x.AddConsumer<SetQuestionNsfwScores>();
            x.UsingRabbitMq((context, cfg) =>
            {
                cfg.Host("localhost", "/", h =>
                {
                    h.Username("guest");
                    h.Password("guest");
                });

                cfg.ReceiveEndpoint("SetQuestionNsfwScores", e =>
                {
                    e.UseMessageRetry(r =>
                    {
                        r.Immediate(1);
                        r.Handle<SolTake.QuestionService.Infrastructure.ConcurrencyException>();
                    });
                    e.ConfigureConsumer<SetQuestionNsfwScores>(context);
                });
            });
        }
    )
    .AddApplicationServices()
    .AddInfrastructureServices();

var host = builder.Build();
host.Run();
