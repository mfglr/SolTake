using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.Configurations;
using MySocailApp.Application.Services;
using MySocailApp.Application.Services.BlobService;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.ExamAggregate;
using MySocailApp.Domain.QuestionAggregate.DomainServices;
using MySocailApp.Domain.QuestionAggregate.Repositories;
using MySocailApp.Domain.QuestionCommentAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Repositories;
using MySocailApp.Domain.SubjectAggregate;
using MySocailApp.Domain.TopicAggregate;
using MySocailApp.Infrastructure.AccountAggregate;
using MySocailApp.Infrastructure.AppUserAggregate;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.ExamAggregate;
using MySocailApp.Infrastructure.QuestionAggregate;
using MySocailApp.Infrastructure.QuestionCommentAggregate;
using MySocailApp.Infrastructure.Services;
using MySocailApp.Infrastructure.Services.BlobService;
using MySocailApp.Infrastructure.Services.Email;
using MySocailApp.Infrastructure.SolutionAggregate;
using MySocailApp.Infrastructure.SubjectAggregate;
using MySocailApp.Infrastructure.TopicAggregate;
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
                .AddQuestionCommentAggregate();
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
                .AddScoped<IAppUserReadRepository, AppUserReadRepository>()
                .AddScoped<IUserImageBlobNameGenerator, UserImageBlobNameGenerator>()
                .AddScoped<IUserImageBlobService, UserImageBlobService>()
                .AddScoped<UserImageUpdater>()
                .AddScoped<UserImageReader>();
        }
        private static IServiceCollection AddQuestionAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<IExamRepositoryQA, ExamRepositoryQA>()
                .AddScoped<ISubjectRepositoryQA, SubjectRepositoryQA>()
                .AddScoped<ITopicRepositoryQA,TopicRepositoryQA>()
                .AddScoped<IQuestionWriteRepository, QuestionWriteRepository>()
                .AddScoped<IQuestionReadRepository, QuestionReadRepository>()
                .AddScoped<QuestionCreatorDomainService>();
        }
        private static IServiceCollection AddSolutionAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<ISolutionWriteRepository, SolutionWriteRepository>()
                .AddScoped<ISolutionReadRepository, SolutionReadRepository>()
                .AddScoped<IQuestionRepositorySA, QuestionRepositorySA>()
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
        private static IServiceCollection AddQuestionCommentAggregate(this IServiceCollection services)
        {
            return services
                .AddScoped<IQuestionCommentReadRepository, QuestionCommentReadRepository>()
                .AddScoped<IQuestionCommentWriteRepository, QuestionCommentWriteRepository>();
        }
    }
}
