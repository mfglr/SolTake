using MassTransit;
using SolTake.ExamService.Application;
using SolTake.ExamService.Infrastructure;
using SolTake.ExamService.Workers;

var builder = Host.CreateApplicationBuilder(args);

DbConfiguration.Configure();

builder.Services
    .AddMassTransit(cfg =>
    {
        cfg.AddConsumer<ValidateQuestionExam>();
        cfg.UsingRabbitMq((context, cfg) =>
        {
            cfg.Host("localhost", "/", h =>
            {
                h.Username("guest");
                h.Password("guest");
            });
            cfg.ConfigureEndpoints(context);
        });
    })
    .AddApplicationServices()
    .AddInfrastructureServices();

var host = builder.Build();
host.Run();
