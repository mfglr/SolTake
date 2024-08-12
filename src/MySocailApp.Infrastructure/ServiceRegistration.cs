using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.Configurations;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.CommentAggregate.DomainServices;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.ExamAggregate.Interfaces;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.DomainServices;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.Shared;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Interfaces;
using MySocailApp.Domain.SubjectAggregate.Interfaces;
using MySocailApp.Domain.TopicAggregate.Interfaces;
using MySocailApp.Domain.UserConnectionAggregate.Interfaces;
using MySocailApp.Infrastructure.AccountAggregate;
using MySocailApp.Infrastructure.ApplicationServices;
using MySocailApp.Infrastructure.ApplicationServices.BlobService;
using MySocailApp.Infrastructure.ApplicationServices.Email;
using MySocailApp.Infrastructure.AppUserAggregate;
using MySocailApp.Infrastructure.CommentAggregate;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.ExamAggregate;
using MySocailApp.Infrastructure.MessageAggregate;
using MySocailApp.Infrastructure.NotificationAggregate;
using MySocailApp.Infrastructure.QuestionAggregate;
using MySocailApp.Infrastructure.SolutionAggregate;
using MySocailApp.Infrastructure.SubjectAggregate;
using MySocailApp.Infrastructure.TopicAggregate;
using MySocailApp.Infrastructure.UserConnectionAggregate;
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
                .AddAccountAggregate()
                .AddAppUserAggregate()
                .AddQuestionAggregate()
                .AddSolutionAggregate()
                .AddExamAggregate()
                .AddSubjectAggregate()
                .AddTopicAggregate()
                .AddCommentAggregate()
                .AddNotificationAggregate()
                .AddMessageAggregate()
                .AddUserConnectionAggregate();
        }
        private static IServiceCollection AddServices(this IServiceCollection services)
        {
            return services
                .AddScoped<IAccessTokenReader, AccessTokenReader>()
                .AddEmailService()
                .AddBlobService();
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
        private static IServiceCollection AddBlobService(this IServiceCollection services)
        {
            return services
                .AddSingleton<IBlobNameGenerator,BlobNameGenerator>()
                .AddSingleton<IDimentionCalculator, DimentionCalculator>()
                .AddScoped<IBlobService,BlobService>();
        }
        private static IServiceCollection AddDbContext(this IServiceCollection services)
        {
            var configuration = services.BuildServiceProvider().GetRequiredService<IConfiguration>();
            var connectionString = configuration.GetConnectionString("SqlServer");
            return services
               .AddDbContext<AppDbContext>(x => x.UseSqlServer(connectionString))
               .AddScoped<IUnitOfWork, UnitOfWork>()
               .AddScoped<IDomainEventsPublisher, DomainEventsPublisher>();
        }
        private static IServiceCollection AddAccountAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<ITokenService, TokenService>()
                .AddScoped<ITransactionCreator, TransactionCreator>()
                .AddScoped<IAppUserRepository, AppUserRepository>()
                .AddScoped<AccountManager>();
        }
        private static IServiceCollection AddAppUserAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<IAppUserWriteRepository, AppUserWriteRepository>()
                .AddScoped<IAppUserReadRepository, AppUserReadRepository>();
        }
        private static IServiceCollection AddQuestionAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<IQuestionWriteRepository, QuestionWriteRepository>()
                .AddScoped<IQuestionReadRepository, QuestionReadRepository>()
                .AddScoped<QuestionCreatorDomainService>();
        }
        private static IServiceCollection AddSolutionAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<ISolutionWriteRepository, SolutionWriteRepository>()
                .AddScoped<ISolutionReadRepository, SolutionReadRepository>()
                .AddScoped<SolutionCreatorDomainService>();
        }
        private static IServiceCollection AddExamAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<IExamReadRepository, ExamReadRepository>();
        }
        private static IServiceCollection AddSubjectAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<ISubjectReadRepository, SubjectReadRepository>();
        }
        private static IServiceCollection AddTopicAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<ITopicReadRepository, TopicReadRepository>();
        }
        private static IServiceCollection AddCommentAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<ICommentReadRepository, CommentReadRepository>()
                .AddScoped<ICommentWriteRepository, CommentWriteRepository>()
                .AddScoped<CommentCreatorDomainService>()
                .AddSingleton<IUserNameReader,UserNameReader>();
        }
        private static IServiceCollection AddNotificationAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<INotificationWriteRepository, NotificationWriteRepository>()
                .AddScoped<INotificationReadRepository, NotificationReadRepository>();
        }
        private static IServiceCollection AddMessageAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<IMessageWriteRepository, MessageWriteRepository>()
                .AddScoped<IMessageReadRepository, MessageReadRepository>();
        }
        private static IServiceCollection AddUserConnectionAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<IUserConnectionWriteRepository, UserConnectionWriteRepository>()
                .AddScoped<IUserConnectionReadRepository, UserConnectionReadRepository>();
        }
    }
}
