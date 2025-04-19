using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.Configurations;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Domain.ExamAggregate.Interfaces;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;
using MySocailApp.Domain.RoleAggregate.Abstracts;
using MySocailApp.Domain.SubjectAggregate.Interfaces;
using MySocailApp.Domain.TopicAggregate.Abstracts;
using MySocailApp.Infrastructure.CommentDomain;
using MySocailApp.Infrastructure.CommentDomain.CommentAggregate;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.ExamAggregate;
using MySocailApp.Infrastructure.InfrastructureServices;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices;
using MySocailApp.Infrastructure.InfrastructureServices.Email;
using MySocailApp.Infrastructure.InfrastructureServices.Email.MailMessageFactories;
using MySocailApp.Infrastructure.MessageDomain;
using MySocailApp.Infrastructure.NotificationAggregate;
using MySocailApp.Infrastructure.NotificationConnectionAggregate;
using MySocailApp.Infrastructure.QueryRepositories;
using MySocailApp.Infrastructure.QuestionDomain;
using MySocailApp.Infrastructure.RoleAggregate;
using MySocailApp.Infrastructure.SolutionDomain;
using MySocailApp.Infrastructure.StoryDomain;
using MySocailApp.Infrastructure.SubjectAggregate;
using MySocailApp.Infrastructure.TopicAggregate;
using MySocailApp.Infrastructure.UserDomain;
using MySocailApp.Infrastructure.UserDomain.UserUserBlockeAggregate;
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
                .AddCommentDomainInfrastructureService()
                .AddMessageDomainInfrastructureServices()
                .AddExamAggregate()
                .AddSubjectAggregate()
                .AddTopicAggregate()
                .AddCommentAggregate()
                .AddNotificationAggregate()
                .AddRoleAggregate()
                .AddNotificationConnectionAggregate()
                .AddStoryDomainInfrastructureServices()
                .AddUserUserBlockAggregateInfrastructureServices();

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

        private static IServiceCollection AddExamAggregate(this IServiceCollection services)
            => services
                .AddScoped<IExamReadRepository, ExamReadRepository>();

        private static IServiceCollection AddSubjectAggregate(this IServiceCollection services)
            => services
                .AddScoped<ISubjectReadRepository, SubjectReadRepository>();

        private static IServiceCollection AddTopicAggregate(this IServiceCollection services)
            => services
                .AddScoped<ITopicReadRepository, TopicReadRepository>();

        private static IServiceCollection AddNotificationAggregate(this IServiceCollection services)
            => services
                .AddScoped<INotificationWriteRepository, NotificationWriteRepository>()
                .AddScoped<INotificationReadRepository, NotificationReadRepository>();

        private static IServiceCollection AddNotificationConnectionAggregate(this IServiceCollection services)
            => services
                .AddScoped<INotificationConnectionReadRepository, NotificationConnectionReadRepository>()
                .AddScoped<INotificationConnectionWriteRepository, NotificationConnectionWriteRepository>();

        private static IServiceCollection AddRoleAggregate(this IServiceCollection services)
            => services
                .AddScoped<IRoleReadRepository, RoleReadRepository>();
       
    }
}
