using Microsoft.AspNetCore.Localization;
using MySocailApp.Api;
using MySocailApp.Api.Middlewares;
using MySocailApp.Application;
using MySocailApp.Application.Hubs;
using MySocailApp.Infrastructure;
using System.Globalization;

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
    .AddInfrastructureServices();

//Localazition
builder.Services.AddLocalization(options => options.ResourcesPath = "Resources");
builder.Services.Configure<RequestLocalizationOptions>(options =>
{
    var supportedCultures = new List<CultureInfo>
    {
        new ("en"),
        new ("tr")
    };

    options.DefaultRequestCulture = new RequestCulture(culture: "en", uiCulture: "en");
    options.SupportedCultures = supportedCultures;
    options.SupportedUICultures = supportedCultures;
});


var app = builder.Build();
app.InitializeDb();

// Configure the HTTP request pipeline.
app.UseMiddleware<CustomExceptionHandlerMiddleware>();
app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();
app.UseRequestLocalization();
app.MapControllers();
app.MapHub<NotificationHub>("/notification");
app.MapHub<MessageHub>("/message");
app.Run();
