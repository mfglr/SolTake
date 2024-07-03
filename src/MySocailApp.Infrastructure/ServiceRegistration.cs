using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.Configurations;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Infrastructure.AppUserAggregate;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Services;
using MySocailApp.Infrastructure.Services.Email;
using System.Net;
using System.Net.Mail;

namespace MySocailApp.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services)
        {
            return services
                .AddServices()
                .AddDbContext()
                .AddAppUserAggregate();
        }

        private static IServiceCollection AddServices(this IServiceCollection services)
        {
            return services
                .AddScoped<IAccessTokenReader, AccessTokenReader>()
                .AddScoped<IAccountAccessor, AccountAccessor>()
                .AddScoped<ITokenService, TokenService>()
                .AddEmailService();
        }

        private static IServiceCollection AddEmailService(this IServiceCollection services)
        {
            var emailServiceSettings = services.BuildServiceProvider().GetRequiredService<IEmailServiceSettings>()!;

            return services
                .AddScoped(
                    sp =>
                    {
                        return new SmtpClient()
                        {
                            Host = emailServiceSettings.Host,
                            Port = emailServiceSettings.Port,
                            DeliveryMethod = SmtpDeliveryMethod.Network,
                            UseDefaultCredentials = false,
                            Credentials = new NetworkCredential(emailServiceSettings.SenderMail, emailServiceSettings.Password),
                            EnableSsl = true
                        };
                    }
                )
                .AddScoped<MailMessageFactory>()
                .AddScoped<IEmailService, EmailService>();
        }

        private static IServiceCollection AddDbContext(this IServiceCollection services)
        {
            var configuration = services.BuildServiceProvider().GetRequiredService<IConfiguration>();
            var connectionString = configuration.GetConnectionString("SqlServer");
            return services
               .AddDbContext<AppDbContext>(x => x.UseSqlServer(connectionString))
               .AddScoped<ITransactionCreator, TransactionCreator>()
               .AddScoped<IUnitOfWork, UnitOfWork>()
               .AddScoped<IDomainEventsPublisher, DomainEventsPublisher>();
        }

        private static IServiceCollection AddAppUserAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<IAppUserRepository, AppUserRepository>()
                .AddScoped<IAppUserReadRepository, AppUserReadRepository>()
                .AddScoped<IUserImageBlobNameGenerator, UserImageBlobNameGenerator>()
                .AddScoped<IUserImageBlobService, UserImageBlobService>()
                .AddScoped<UserImageUpdater>()
                .AddScoped<UserImageReader>();
        }
    }
}
