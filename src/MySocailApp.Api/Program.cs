using MySocailApp.Api;
using MySocailApp.Api.Middlewares;
using MySocailApp.Application;
using MySocailApp.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddSignalR();
builder.Services
    .AddConfigurations()
    .AddFilters()
    .AddJWT()
    .AddIdentity()
    .AddHttpContextAccessor()
    .AddApplicationServices()
    .AddInfrastructureServices(builder.Configuration);
    

var app = builder.Build();
app.InitializeDb();

// Configure the HTTP request pipeline.
app.UseMiddleware<CustomExceptionHandlerMiddleware>();
app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.Run();
