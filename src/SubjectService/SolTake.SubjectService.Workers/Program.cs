using MassTransit;
using SolTake.SubjectService.Application;
using SolTake.SubjectService.Infrastructure;
using SolTake.SubjectService.Workers;

var builder = Host.CreateApplicationBuilder(args);

DbConfigration.Configure();


builder.Services
    .AddMassTransit(cfg =>
    {
        cfg.AddConsumer<ValidateQuestionSubject>();
        cfg.UsingRabbitMq((context, cfg) =>
        {
            cfg.Host(
                builder.Configuration["RabbitMqSettings:Host"],
                builder.Configuration["RabbitMqSettings:VirtualHost"],
                h => {
                    h.Password(builder.Configuration["RabbitMqSettings:Password"]!);
                    h.Username(builder.Configuration["RabbitMqSettings:Username"]!);
                }
            );
            cfg.ConfigureEndpoints(context);
        });
    })
    .AddApplicationServices()
    .AddInfrastructureServices();

var host = builder.Build();
host.Run();
