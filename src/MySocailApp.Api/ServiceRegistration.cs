using AccountDomain.AccountAggregate.Configurations;
using AccountDomain.AccountAggregate.Entities;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Configurations;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.InfrastructureServices.IAService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.AppVersionAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.Entities;
using MySocailApp.Infrastructure.AppVersionAggregate;
using MySocailApp.Infrastructure.DbContexts;
using System.IdentityModel.Tokens.Jwt;
using System.Text;

namespace MySocailApp.Api
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddConfigurations(this IServiceCollection services)
        {
            var configuration = services.BuildServiceProvider().GetRequiredService<IConfiguration>();
            var tokenProviderOptions = configuration.GetRequiredSection("TokenProviderOptions").Get<TokenProviderOptions>()!;
            var emailServiceSettings = configuration.GetRequiredSection("EmailServiceSettings").Get<EmailServiceSettings>()!;
            var applicationSettings = configuration.GetRequiredSection("ApplicationSettings").Get<ApplicationSettings>()!;
            var faceBookSettings = configuration.GetRequiredSection("FaceBookSettings").Get<FaceBookSettings>()!;
            var chatGptSettings = configuration.GetRequiredSection("ChatGPTSettings").Get<ChatGPTSettings>()!;

            return services
                .AddSingleton<ITokenProviderOptions>(tokenProviderOptions)
                .AddSingleton<IEmailServiceSettings>(emailServiceSettings)
                .AddSingleton<IApplicationSettings>(applicationSettings)
                .AddSingleton<IFaceBookSettings>(faceBookSettings)
                .AddSingleton<IChatGPTSettings>(chatGptSettings);
        }
        public static IServiceCollection AddFilters(this IServiceCollection services)
        {
            return services
                .AddScoped<CheckVersionFiltterAttribute>()
                .AddScoped<CheckAccountFilterAttribute>()
                .AddScoped<CheckPrivacyPolicyApprovalFilterAttribute>()
                .AddScoped<CheckTermsOfUseApprovalFilterAttribute>()
                .AddScoped<CheckEmailVerificationFilterAttribute>();
        }
        public static IServiceCollection AddJWT(this IServiceCollection services)
        {
            var tokenProviderOptions = services.BuildServiceProvider().GetRequiredService<ITokenProviderOptions>()!;
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(tokenProviderOptions.SecurityKey));

            services
                .AddSingleton<JwtSecurityTokenHandler>()
                .AddSingleton(sp => new SigningCredentials(securityKey,SecurityAlgorithms.HmacSha256Signature))
                .AddAuthentication(opt =>
                {
                    opt.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                    opt.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                })
                .AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, opt =>
                {
                    opt.Events = new JwtBearerEvents
                    {
                        OnMessageReceived = context =>
                        {
                            var accessToken = context.Request.Query["access_token"];
                            var pathString = context.Request.Path;
                            if (pathString.StartsWithSegments("/message") || pathString.StartsWithSegments("/notification"))
                                context.Token = accessToken;
                            return Task.CompletedTask;
                        }
                    };

                    opt.TokenValidationParameters = new()
                    {
                        IssuerSigningKey = securityKey,
                        ValidIssuer = tokenProviderOptions.Issuer,
                        ValidAudience = tokenProviderOptions.Audience,

                        ValidateIssuerSigningKey = true,
                        ValidateAudience = true,
                        ValidateIssuer = true,
                        ValidateLifetime = true,
                        ClockSkew = TimeSpan.Zero
                    };
                });
            return services;
        }

        public static IServiceCollection InitializeDb(this IServiceCollection services)
        {
            using var scope = services.BuildServiceProvider().CreateScope();
            using var context = scope.ServiceProvider.GetRequiredService<AppDbContext>();
            context.Database.Migrate();

            //initiliaze versionCacheService
            var versionCacheService = new AppVersionCacheService();
            var versions = context.AppVersions.AsNoTracking().ToList();
            versionCacheService.Init(versions);

            return services
                .AddScoped<IAppVersionReadRepository, AppVersionReadRepository>()
                .AddScoped<IAppVersionWriteRepository, AppVersionWriteRepository>()
                .AddSingleton<IAppVersionCacheService>(versionCacheService);
        }
    }
}
