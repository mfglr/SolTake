using MassTransit;
using SolTake.ExamService.Application;
using SolTake.ExamService.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

DbConfiguration.Configure();

builder.Services.AddControllers();

builder.Services
    .AddMassTransit(cfg =>
    {
        cfg.UsingRabbitMq((context, cfg) =>
        {
            cfg.Host("localhost", "/", h =>
            {
                h.Username("guest");
                h.Password("guest");
            });
        });
    })
    .AddApplicationServices()
    .AddInfrastructureServices();

var app = builder.Build();

app.UseAuthorization();

app.MapControllers();

app.Run();
