using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService;
using MySocailApp.Infrastructure.MessageDomain;
using MySocailApp.Infrastructure.QuestionDomain;
using SolTake.Application.Configurations;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Domain.AppVersionAggregate.Abstracts;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;
using SolTake.Domain.RoleAggregate.Abstracts;
using SolTake.Domain.SubjectAggregate.Interfaces;
using SolTake.Domain.TopicAggregate.Abstracts;
using SolTake.Infrastructure.AppVersionAggregate;
using SolTake.Infrastructure.CommentDomain;
using SolTake.Infrastructure.CommentDomain.CommentAggregate;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.ExamAggregate;
using SolTake.Infrastructure.InfrastructureServices;
using SolTake.Infrastructure.InfrastructureServices.BlobService;
using SolTake.Infrastructure.InfrastructureServices.BlobService.InternalServices;
using SolTake.Infrastructure.InfrastructureServices.Email;
using SolTake.Infrastructure.InfrastructureServices.Email.MailMessageFactories;
using SolTake.Infrastructure.NotificationAggregate;
using SolTake.Infrastructure.NotificationConnectionAggregate;
using SolTake.Infrastructure.QueryRepositories;
using SolTake.Infrastructure.Repositories;
using SolTake.Infrastructure.RoleAggregate;
using SolTake.Infrastructure.SolutionDomain;
using SolTake.Infrastructure.StoryDomain;
using SolTake.Infrastructure.SubjectAggregate;
using SolTake.Infrastructure.TopicAggregate;
using SolTake.Infrastructure.UserDomain;
using SolTake.Infrastructure.UserDomain.UserUserBlockeAggregate;
using System.Net;
using System.Net.Mail;

namespace SolTake.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services)
            => services
                .AddDbContext()
                .InitializeDb()
                .AddScoped<IAccessTokenReader, AccessTokenReader>()
                .AddScoped<IUserAccessor, UserAccessor>()
                .AddEmailService()
                .AddBlobService()
                .AddQueryRepositories()
                .AddRepositories()
                .AddUserDomainInfrastructureServices()
                .AddQuestionDomainInfrastructureServices()
                .AddSolutionDomainInfrastructureServices()
                .AddCommentDomainInfrastructureService()
                .AddMessageDomainInfrastructureServices()
                .AddExamInfrastructureServices()
                .AddSubjectAggregate()
                .AddTopicAggregate()
                .AddCommentAggregate()
                .AddNotificationAggregate()
                .AddRoleAggregate()
                .AddNotificationConnectionAggregate()
                .AddStoryDomainInfrastructureServices()
                .AddUserUserBlockAggregateInfrastructureServices();


        private static IServiceCollection InitializeDb(this IServiceCollection services)
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
                .AddScoped<IFrameCatcher,FrameCatcher>()
                .AddScoped<IImageToBase64Convertor,ImageToBase64Convertor>();

        private static IServiceCollection AddDbContext(this IServiceCollection services)
        {
            var configuration = services.BuildServiceProvider().GetRequiredService<IConfiguration>();
            var connectionString = configuration.GetConnectionString("SqlServer");
            return services
               .AddDbContext<AppDbContext>(x => x.UseSqlServer(connectionString))
               .AddScoped<IUnitOfWork, UnitOfWork>()
               .AddScoped<IDomainEventsPublisher, DomainEventsPublisher>();
        }

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
