using MassTransit;
using SolTake.QuestionService.Application;
using SolTake.QuestionService.Infrastructure;
using SolTake.QuestionService.Workers;

var builder = Host.CreateApplicationBuilder(args);

DbConfiguration.Configure();

builder.Services
    .AddMassTransit(
        x =>
        {
            x.AddConsumer<MarkExamStateAsValid>();
            x.AddConsumer<MarkExamStateAsInvalid>();
            x.AddConsumer<MarkSubjectStateAsValid>();
            x.AddConsumer<MarkSubjectStateAsInvalid>();
            x.AddConsumer<SetContentNsfwScore>();
            x.AddConsumer<SetTopicsNsfwScores>();

            x.UsingRabbitMq((context, cfg) =>
            {
                cfg.Host("localhost", "/", h =>
                {
                    h.Username("guest");
                    h.Password("guest");
                });

                var retryLimit = 3;

                cfg.ReceiveEndpoint("MarkSubjectStateAsValid", e =>
                {
                    e.UseMessageRetry(r =>
                    {
                        r.Immediate(retryLimit);
                        r.Handle<SolTake.QuestionService.Infrastructure.ConcurrencyException>();
                    });
                    e.ConfigureConsumer<MarkSubjectStateAsValid>(context);
                });
                cfg.ReceiveEndpoint("MarkSubjectStateAsInvalid", e =>
                {
                    e.UseMessageRetry(r =>
                    {
                        r.Immediate(retryLimit);
                        r.Handle<SolTake.QuestionService.Infrastructure.ConcurrencyException>();
                    });
                    e.ConfigureConsumer<MarkSubjectStateAsInvalid>(context);
                });

                cfg.ReceiveEndpoint("MarkExamStateAsValid", e =>
                {
                    e.UseMessageRetry(r =>
                    {
                        r.Immediate(retryLimit);
                        r.Handle<SolTake.QuestionService.Infrastructure.ConcurrencyException>();
                    });
                    e.ConfigureConsumer<MarkExamStateAsValid>(context);
                });
                cfg.ReceiveEndpoint("MarkExamStateAsInvalid", e =>
                {
                    e.UseMessageRetry(r =>
                    {
                        r.Immediate(retryLimit);
                        r.Handle<SolTake.QuestionService.Infrastructure.ConcurrencyException>();
                    });
                    e.ConfigureConsumer<MarkExamStateAsInvalid>(context);
                });

                cfg.ReceiveEndpoint("SetContentNsfwScore", e =>
                {
                    e.UseMessageRetry(r =>
                    {
                        r.Immediate(retryLimit);
                        r.Handle<SolTake.QuestionService.Infrastructure.ConcurrencyException>();
                    });
                    e.ConfigureConsumer<SetContentNsfwScore>(context);
                });

                cfg.ReceiveEndpoint("SetTopicsNsfwScores", e =>
                {
                    e.UseMessageRetry(r =>
                    {
                        r.Immediate(retryLimit);
                        r.Handle<SolTake.QuestionService.Infrastructure.ConcurrencyException>();
                    });
                    e.ConfigureConsumer<SetTopicsNsfwScores>(context);
                });
            });
        }
    )
    .AddApplicationServices()
    .AddInfrastructureServices();

var host = builder.Build();
host.Run();
