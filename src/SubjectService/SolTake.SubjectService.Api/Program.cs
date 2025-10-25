using MassTransit;
using SolTake.SubjectService.Application;
using SolTake.SubjectService.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

DbConfigration.Configure();

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
