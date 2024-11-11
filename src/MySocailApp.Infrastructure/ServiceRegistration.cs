using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.Configurations;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AppUserAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.DomainServices;
using MySocailApp.Domain.ExamAggregate.Interfaces;
using MySocailApp.Domain.MessageAggregate.DomainServices;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;
using MySocailApp.Domain.PrivacyPolicyAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SubjectAggregate.Interfaces;
using MySocailApp.Domain.TermsOfUseAggregate.Abstracts;
using MySocailApp.Domain.TopicAggregate.Interfaces;
using MySocailApp.Domain.UserConnectionAggregate.Interfaces;
using MySocailApp.Infrastructure.AccountAggregate;
using MySocailApp.Infrastructure.AppUserAggregate;
using MySocailApp.Infrastructure.CommentAggregate;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.ExamAggregate;
using MySocailApp.Infrastructure.InfrastructureServices;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices;
using MySocailApp.Infrastructure.InfrastructureServices.Email;
using MySocailApp.Infrastructure.InfrastructureServices.Email.MailMessageFactories;
using MySocailApp.Infrastructure.MessageAggregate;
using MySocailApp.Infrastructure.NotificationAggregate;
using MySocailApp.Infrastructure.NotificationConnectionAggregate;
using MySocailApp.Infrastructure.PrivacyPolicyAggreagate;
using MySocailApp.Infrastructure.QueryRepositories;
using MySocailApp.Infrastructure.QuestionAggregate;
using MySocailApp.Infrastructure.SolutionAggregate;
using MySocailApp.Infrastructure.SubjectAggregate;
using MySocailApp.Infrastructure.TermsOfUseAggregate;
using MySocailApp.Infrastructure.TopicAggregate;
using MySocailApp.Infrastructure.UserConnectionAggregate;
using System.Net;
using System.Net.Mail;

namespace MySocailApp.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services)
            => services
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
                .AddPrivacyPolicyAggregate()
                .AddTermsOfUseAggregate()
                .AddUserConnectionAggregate()
                .AddNotificationConnectionAggregate();
        private static IServiceCollection AddServices(this IServiceCollection services)
            => services
                .AddScoped<IAccessTokenReader, AccessTokenReader>()
                .AddEmailService()
                .AddBlobService()
                .AddQueryRepositories();
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
                .AddScoped<EmailConfirmationMailMessageFactory>()
                .AddScoped<IEmailService, EmailService>();
        }
        private static IServiceCollection AddBlobService(this IServiceCollection services)
            => services
                .AddScoped<UniqNameGenerator>()
                .AddScoped<DimentionCalculator>()
                .AddScoped<FrameCatcher>()
                .AddScoped<VideoDurationCalculator>()
                .AddScoped<PathFinder>()
                .AddScoped<VideoFastStartConverter>()
                .AddScoped<TempDirectoryService>()
                .AddScoped<IBlobService, LocalBlobService>()
                .AddScoped<IImageService, ImageService>()
                .AddScoped<ITextService, TextService>()
                .AddScoped<IVideoService, VideoService>();


        private static IServiceCollection AddDbContext(this IServiceCollection services)
        {
            var configuration = services.BuildServiceProvider().GetRequiredService<IConfiguration>();
            var connectionString = configuration.GetConnectionString("SqlServer");
            return services
               .AddDbContext<AppDbContext>(x => x.UseSqlServer(connectionString))
               .AddScoped<IUnitOfWork, UnitOfWork>()
               .AddScoped<IDomainEventsPublisher, DomainEventsPublisher>();
        }
        private static IServiceCollection AddQueryRepositories(this IServiceCollection services)
            => services
                .AddScoped<IAppUserQueryRepository, AppUserQueryRepository>()
                .AddScoped<ICommentUserLikeQueryRepository, CommentUserLikeQueryRepository>()
                .AddScoped<IFollowQueryRepository, FollowQueryRepository>()
                .AddScoped<IUserSearchQueryRepository, UserSearchQueryRepository>()
                .AddScoped<IQuestionQueryRepository, QuestionQueryRepository>()
                .AddScoped<IQuestionUserLikeQueryRepository, QuestionUserLikeQueryRepository>()
                .AddScoped<IQuestionUserSaveQueryRepository, QuestionUserSaveQuestionRepository>()
                .AddScoped<ISolutionQueryRepository, SolutionQueryRepository>()
                .AddScoped<ICommentQueryRepository, CommentQueryRepository>()
                .AddScoped<ISolutionUserVoteQueryRepository, SolutionUserVoteQueryRepository>()
                .AddScoped<IMessageQueryRepository, MessageQueryRepository>()
                .AddScoped<ITopicQueryRepository, TopicQueryRepository>()
                .AddScoped<ISubjectQueryRepository, SubjectQueryRepository>()
                .AddScoped<ISolutionUserSaveQueryRepository,SolutionUserSaveQueryRepository>()
                .AddScoped<INotificationQueryRepository,NotificationQueryRepository>();
        
        private static IServiceCollection AddAccountAggregate(this IServiceCollection services)
            => services
                .AddScoped<IAccountReadRepository, AccountReadRepository>()
                .AddScoped<IAccountWriteRepository, AccountWriteRepository>()
                .AddScoped<ITransactionCreator, TransactionCreator>();

        private static IServiceCollection AddPrivacyPolicyAggregate(this IServiceCollection services)
            => services
                .AddScoped<IPrivacyPolicyReadRepository, PolicyReadRepository>()
                .AddScoped<IPrivacyPolicyWriteRepository, PolicyWriteRepository>();

        private static IServiceCollection AddTermsOfUseAggregate(this IServiceCollection services)
            => services
                .AddScoped<ITermsOfUseReadRepository, TermsOfUseReadRepository>()
                .AddScoped<ITermsOfUseWriteRepository, TermsOfUseWriteRepository>();

        private static IServiceCollection AddAppUserAggregate(this IServiceCollection services)
            => services
                .AddScoped<IAppUserWriteRepository, AppUserWriteRepository>()
                .AddScoped<IAppUserReadRepository, AppUserReadRepository>();
        
        private static IServiceCollection AddQuestionAggregate(this IServiceCollection services)
            => services
                .AddScoped<IQuestionWriteRepository, QuestionWriteRepository>()
                .AddScoped<IQuestionReadRepository, QuestionReadRepository>()
                .AddScoped<QuestionCreatorDomainService>();
        
        private static IServiceCollection AddSolutionAggregate(this IServiceCollection services)
            => services
                .AddScoped<ISolutionWriteRepository, SolutionWriteRepository>()
                .AddScoped<ISolutionReadRepository, SolutionReadRepository>()
                .AddScoped<SolutionStateMarker>()
                .AddScoped<SolutionCreatorDomainService>();
        
        private static IServiceCollection AddExamAggregate(this IServiceCollection services)
            => services
                .AddScoped<IExamReadRepository, ExamReadRepository>();
        
        private static IServiceCollection AddSubjectAggregate(this IServiceCollection services)
            => services
                .AddScoped<ISubjectReadRepository, SubjectReadRepository>();
        
        private static IServiceCollection AddTopicAggregate(this IServiceCollection services)
            => services
                .AddScoped<ITopicReadRepository, TopicReadRepository>();
        
        private static IServiceCollection AddCommentAggregate(this IServiceCollection services)
            => services
                .AddScoped<ICommentReadRepository, CommentReadRepository>()
                .AddScoped<ICommentWriteRepository, CommentWriteRepository>()
                .AddScoped<CommentCreatorDomainService>();
        
        private static IServiceCollection AddNotificationAggregate(this IServiceCollection services)
            => services
                .AddScoped<INotificationWriteRepository, NotificationWriteRepository>()
                .AddScoped<INotificationReadRepository, NotificationReadRepository>();
        
        private static IServiceCollection AddMessageAggregate(this IServiceCollection services)
            => services
                .AddScoped<IMessageWriteRepository, MessageWriteRepository>()
                .AddScoped<IMessageReadRepository, MessageReadRepository>()
                .AddScoped<MessageRemoverDomainService>()
                .AddScoped<MessageCreaterDomainService>();
        
        private static IServiceCollection AddUserConnectionAggregate(this IServiceCollection services)
            => services
                .AddScoped<IUserConnectionWriteRepository, UserConnectionWriteRepository>()
                .AddScoped<IUserConnectionReadRepository, UserConnectionReadRepository>();
        
        private static IServiceCollection AddNotificationConnectionAggregate(this IServiceCollection services)
            => services
                .AddScoped<INotificationConnectionReadRepository, NotificationConnectionReadRepository>()
                .AddScoped<INotificationConnectionWriteRepository, NotificationConnectionWriteRepository>();
    }
}
