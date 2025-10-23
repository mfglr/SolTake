using MassTransit;
using SolTake.BlobService.Api;
using SolTake.BlobService.Application;
using SolTake.BlobService.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

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
    .AddBlobApplicationServices()
    .AddBlobInfrastructureServices();

var app = builder.Build();

app.UseMiddleware<CustomExceptionHandlerMiddleware>();
app.UseAuthorization();
app.MapControllers();
app.Run();
