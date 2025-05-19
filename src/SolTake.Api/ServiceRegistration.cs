using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Configurations;
using MySocailApp.Domain.UserAggregate.Configurations;
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
            var chatGptSettings = configuration.GetRequiredSection("ChatGPTSettings").Get<ChatGPTSettings>()!;

            return services
                .AddSingleton<ITokenProviderOptions>(tokenProviderOptions)
                .AddSingleton<IEmailServiceSettings>(emailServiceSettings)
                .AddSingleton<IApplicationSettings>(applicationSettings)
                .AddSingleton<IChatGPTSettings>(chatGptSettings);
        }
        public static IServiceCollection AddFilters(this IServiceCollection services)
        {
            return services
                .AddScoped<VersionFiltterAttribute>()
                .AddScoped<UserFilterAttribute>()
                .AddScoped<PrivacyPolicyApprovalFilterAttribute>()
                .AddScoped<TermsOfUseApprovalFilterAttribute>()
                .AddScoped<EmailVerificationFilterAttribute>();
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
                .AddJwtBearer(
                    JwtBearerDefaults.AuthenticationScheme,
                    opt => {
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
                    }
                );
            return services;
        }
    }
}
