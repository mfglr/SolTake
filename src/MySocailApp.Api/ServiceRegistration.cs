using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Configurations;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.ExamAggregate;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Domain.SubjectAggregate;
using MySocailApp.Domain.TopicAggregate;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.TokenProviders;
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

            return services
                .AddSingleton<ITokenProviderOptions>(tokenProviderOptions)
                .AddSingleton<IEmailServiceSettings>(emailServiceSettings)
                .AddSingleton<IApplicationSettings>(applicationSettings);
        }

        public static IServiceCollection AddFilters(this IServiceCollection services)
        {
            return services
                .AddScoped<SetAccountFilterAttribute>()
                .AddScoped<EmailConfirmedFilterAttribute>();
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
                           if (!string.IsNullOrEmpty(accessToken))
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
                    };
                });
            return services;
        }
        public static IServiceCollection AddIdentity(this IServiceCollection services)
        {
            services
                .AddIdentity<Account, IdentityRole<int>>(
                    opt =>
                    {
                        opt.Password.RequireNonAlphanumeric = false;
                        opt.Password.RequireUppercase = false;
                        opt.Password.RequireLowercase = false;
                        opt.Password.RequireDigit = false;
                        opt.Password.RequiredLength = 6;

                        opt.User.AllowedUserNameCharacters = "0123456789abcdefghijklmnopqrstuvwxyz_.";
                        opt.User.RequireUniqueEmail = true;

                        opt.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(3);
                        opt.Lockout.MaxFailedAccessAttempts = 5;
                    }
                )
                .AddEntityFrameworkStores<AppDbContext>()
                .AddDefaultTokenProviders()
                .AddTokenProvider<RefreshTokenProvider<Account>>(TokenProviders.REFRESH_TOKEN_PROVIDER);

            return services;
        }
        public static void InitializeDb(this WebApplication app)
        {
            using var scope = app.Services.CreateScope();
            using var context = scope.ServiceProvider.GetRequiredService<AppDbContext>();
            context.Database.Migrate();

            if(!context.Roles.Any(x => x.Name == "user"))
            {
                context.Roles.Add(new()
                {
                    Name = "user",
                    NormalizedName = "USER"
                });
                context.SaveChanges();

            }

            if (!context.Exams.Any())
            {
                var exam = new Exam();
                exam.Create("TYT", "Temel Yeterlilik Testi");
                context.Exams.Add(exam);
                context.SaveChanges();

                var subject = new Subject();
                subject.Create(exam.Id, "TYT-Türkçe");
                context.Subjects.Add(subject);
                context.SaveChanges();

                var topic = new Topic();
                topic.Create(subject.Id,"Sözcükte Anlam");
                context.Topics.Add(topic);
                context.SaveChanges();
            }

        }
    }
}
