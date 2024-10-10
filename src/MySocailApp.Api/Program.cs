using Microsoft.AspNetCore.Http.Features;
using MySocailApp.Api;
using MySocailApp.Api.Middlewares;
using MySocailApp.Application;
using MySocailApp.Application.Hubs;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Infrastructure;

var builder = WebApplication.CreateBuilder(args);
builder.WebHost.ConfigureKestrel(options => options.Limits.MaxRequestBodySize = int.MaxValue);
// Add services to the container.

builder.Services.Configure<FormOptions>(options =>
{
    options.MultipartBodyLengthLimit = int.MaxValue;
});



builder.Services.AddControllersWithViews();
builder.Services.AddSignalR();
builder.Services
    .AddConfigurations()
    .AddFilters()
    .AddJWT()
    .AddIdentity()
    .AddHttpContextAccessor()
    .AddApplicationServices()
    .AddInfrastructureServices()
    .AddAccountDomainServices();


var app = builder.Build();
app.InitializeDb();

// Configure the HTTP request pipeline.
app.UseMiddleware<CustomExceptionHandlerMiddleware>();
app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseAuthentication();
app.UseAuthorization();
app.UseRequestLocalization();
app.MapControllers();
app.MapHub<NotificationHub>("/notification");
app.MapHub<MessageHub>("/message");
app.Run();
