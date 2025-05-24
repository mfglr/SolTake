using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.SignalR;
using SolTake.Api;
using SolTake.Api.HubFilters;
using SolTake.Api.Middlewares;
using SolTake.Application;
using SolTake.Application.Hubs;
using SolTake.Domain;
using SolTake.Infrastructure;

var builder = WebApplication.CreateBuilder(args);
builder.WebHost.ConfigureKestrel(options => options.Limits.MaxRequestBodySize = int.MaxValue);
builder.Services.Configure<FormOptions>(options =>
{
    options.MultipartBodyLengthLimit = int.MaxValue;
});

builder.Services.AddControllersWithViews();
builder.Services
    .AddSignalR(
        opt => {
            opt.AddFilter<UserHubFilter>();
            opt.AddFilter<PrivacyPolicyApprovalHubFilter>();
            opt.AddFilter<TermsOfUseApprovalHubFilter>();
            opt.AddFilter<EmailVerficationHubFilter>();
        }
    );

builder.Services
    .AddConfigurations()
    .AddFilters()
    .AddJWT()
    .AddHttpContextAccessor()
    .AddDomain()
    .AddApplicationServices()
    .AddInfrastructureServices();

var app = builder.Build();

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
