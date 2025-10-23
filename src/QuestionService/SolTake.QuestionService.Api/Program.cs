using MassTransit;
using SolTake.QuestionService.Application;
using SolTake.QuestionService.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

DbConfiguration.Configure();

builder.Services.AddControllers();
builder.Services
    .AddMassTransit(
        x =>
        {
            x.UsingRabbitMq((context, cfg) =>
            {
                cfg.Host("localhost", "/", h =>
                {
                    h.Username("guest");
                    h.Password("guest");
                });
            });
        }
    )
    .AddQuestionApplicationServices()
    .AddQuestionInfrastructureServices(builder.Configuration);

var app = builder.Build();


app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
