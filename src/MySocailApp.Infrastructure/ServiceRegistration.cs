using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.Configurations;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;
using MySocailApp.Domain.QuestionDomain.ExamAggregate.Interfaces;
using MySocailApp.Domain.QuestionDomain.SubjectAggregate.Interfaces;
using MySocailApp.Domain.QuestionDomain.TopicAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.RoleAggregate.Abstracts;
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
using MySocailApp.Infrastructure.QueryRepositories;
using MySocailApp.Infrastructure.QuestionDomain;
using MySocailApp.Infrastructure.RoleAggregate;
using MySocailApp.Infrastructure.SolutionDomain;
using MySocailApp.Infrastructure.SolutionDomain.SolutionAggregate;
using MySocailApp.Infrastructure.SubjectAggregate;
using MySocailApp.Infrastructure.TopicAggregate;
using MySocailApp.Infrastructure.UserConnectionAggregate;
using MySocailApp.Infrastructure.UserDomain;
using System.Net;
using System.Net.Mail;

namespace MySocailApp.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services)
            => services
                .AddDbContext()
                .AddServices()
                .AddUserDomainInfrastructureServices()
                .AddQuestionDomainInfrastructureServices()
                .AddSolutionDomainInfrastructureServices()
                .AddExamAggregate()
                .AddSubjectAggregate()
                .AddTopicAggregate()
                .AddCommentAggregate()
                .AddNotificationAggregate()
                .AddMessageAggregate()
                .AddUserConnectionAggregate()
                .AddRoleAggregate()
                .AddNotificationConnectionAggregate();

        private static IServiceCollection AddServices(this IServiceCollection services)
            => services
                .AddScoped<IAccessTokenReader, AccessTokenReader>()
                .AddScoped<IUserAccessor, UserAccessor>()
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
                .AddScoped<EmailVerificationMailMessageFactory>()
                .AddScoped<ResetPasswordMailMessgeFactory>()
                .AddScoped<IEmailService, EmailService>();
        }
        private static IServiceCollection AddBlobService(this IServiceCollection services)
            => services
                .AddScoped<UniqNameGenerator>()
                .AddScoped<DimentionCalculator>()
                .AddScoped<VideoDurationCalculator>()
                .AddScoped<VideoDimentionCalculator>()
                .AddScoped<VideoManipulator>()
                .AddScoped<AudioDurationCalculator>()
                .AddScoped<AudioManipulator>()
                .AddScoped<IPathFinder, PathFinder>()
                .AddScoped<ITempDirectoryService,TempDirectoryService>()
                .AddScoped<IBlobService, LocalBlobService>()
                .AddScoped<ITextService, TextService>()
                .AddScoped<IMultimediaService,MultiMediaService>()
                .AddScoped<IFrameCatcher,FrameCatcher>();


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
                .AddScoped<IUserQueryRepository, UserQueryRepository>()
                .AddScoped<ICommentUserLikeQueryRepository, CommentUserLikeQueryRepository>()
                .AddScoped<IFollowQueryRepository, FollowQueryRepository>()
                .AddScoped<IUserUserSearchQueryRepository, UserUserSearchedQueryRepository>()
                .AddScoped<IQuestionQueryRepository, QuestionQueryRepository>()
                .AddScoped<IQuestionUserLikeQueryRepository, QuestionUserLikeQueryRepository>()
                .AddScoped<IQuestionUserSaveQueryRepository, QuestionUserSaveQueryRepository>()
                .AddScoped<ISolutionQueryRepository, SolutionQueryRepository>()
                .AddScoped<ICommentQueryRepository, CommentQueryRepository>()
                .AddScoped<ISolutionUserVoteQueryRepository, SolutionUserVoteQueryRepository>()
                .AddScoped<IMessageQueryRepository, MessageQueryRepository>()
                .AddScoped<ITopicQueryRepository, TopicQueryRepository>()
                .AddScoped<ISubjectQueryRepository, SubjectQueryRepository>()
                .AddScoped<ISolutionUserSaveQueryRepository, SolutionUserSaveQueryRepository>()
                .AddScoped<INotificationQueryRepository, NotificationQueryRepository>();

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
                .AddScoped<ICommentWriteRepository, CommentWriteRepository>();

        private static IServiceCollection AddNotificationAggregate(this IServiceCollection services)
            => services
                .AddScoped<INotificationWriteRepository, NotificationWriteRepository>()
                .AddScoped<INotificationReadRepository, NotificationReadRepository>();
        
        private static IServiceCollection AddMessageAggregate(this IServiceCollection services)
            => services
                .AddScoped<IMessageWriteRepository, MessageWriteRepository>()
                .AddScoped<IMessageReadRepository, MessageReadRepository>();

        private static IServiceCollection AddUserConnectionAggregate(this IServiceCollection services)
            => services
                .AddScoped<IMessageConnectionWriteRepository, UserConnectionWriteRepository>()
                .AddScoped<IMessageConnectionReadRepository, UserConnectionReadRepository>();

        private static IServiceCollection AddNotificationConnectionAggregate(this IServiceCollection services)
            => services
                .AddScoped<INotificationConnectionReadRepository, NotificationConnectionReadRepository>()
                .AddScoped<INotificationConnectionWriteRepository, NotificationConnectionWriteRepository>();

        private static IServiceCollection AddRoleAggregate(this IServiceCollection services)
            => services
                .AddScoped<IRoleReadRepository, RoleReadRepository>();
       
    }
}
