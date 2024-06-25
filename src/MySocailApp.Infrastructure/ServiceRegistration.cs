using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.Configurations;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AppNotificationAggregate;
using MySocailApp.Domain.AppNotificationClientAggregate;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Infrastructure.AppNotificationAggregate;
using MySocailApp.Infrastructure.AppNotificationClientAggregate;
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
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services,IConfiguration configuration)
        {
            var connectionString = configuration.GetConnectionString("SqlServer");
            return services
                .AddDbContext<AppDbContext>(x => x.UseSqlServer(connectionString))
                .AddScoped<IAccessTokenReader, AccessTokenReader>()
                .AddScoped<IAccountAccessor, AccountAccessor>()
                .AddScoped<ITokenService, TokenService>()
                .AddScoped<ITransactionCreator, TransactionCreator>()
                .AddScoped<IUnitOfWork, UnitOfWork>()
                .AddEmailService()
                .AddScoped<IDomainEventsPublisher, DomainEventsPublisher>()
                .AddScoped<IAppUserRepository, AppUserRepository>()
                .AddScoped<IAppNotificationRepository, AppNotificationRepository>()
                .AddScoped<IAppNotificationClientRepository, AppNotificationClientRepository>();
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
    }
}
