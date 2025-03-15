using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Api;
using MySocailApp.Api.HubFilters;
using MySocailApp.Api.Middlewares;
using MySocailApp.Application;
using MySocailApp.Application.Hubs;
using MySocailApp.Domain;
using MySocailApp.Domain.AppVersionAggregate;
using MySocailApp.Domain.CommentDomain.CommentAggregate;
using MySocailApp.Domain.MessageDomain.MessageAggregate;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate;
using MySocailApp.Infrastructure;

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
            opt.AddFilter<VersionHubFilter>();
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
    .AddInfrastructureServices()
    .AddAppVersionDomainServices()
    .AddCommentDomainServices()
    .AddMessageDomainServices()
    .AddQuestionDomainServices()
    .AddSolutionDomainServices()
    .InitializeDb();

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
