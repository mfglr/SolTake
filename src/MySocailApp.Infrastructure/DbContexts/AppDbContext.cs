using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using MySocailApp.Domain.AppVersionAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.ExamAggregate.Entitities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.SubjectAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.TopicAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.UserDomain.PrivacyPolicyAggregate;
using MySocailApp.Domain.UserDomain.RoleAggregate.Entities;
using MySocailApp.Domain.UserDomain.TermsOfUseAggregate;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using System.Reflection;

namespace MySocailApp.Infrastructure.DbContexts
{
    public class AppDbContext(DbContextOptions options) : DbContext(options)
    {
        public DbSet<User> Users { get; private set; }
        public DbSet<Role> Roles { get; private set; }
        public DbSet<PrivacyPolicy> PrivacyPolicies { get; private set; }
        public DbSet<TermsOfUse> TermsOfUses { get; private set; }

        public DbSet<UserSearch> UserSearchs { get; private set; }
        public DbSet<Follow> Follows { get; private set; }
        public DbSet<UserFollowNotification> UserFollowNotifications { get; private set; }

        public DbSet<Question> Questions { get; private set; }
        public DbSet<QuestionUserLike> QuestionUserLikes { get; private set; }
        public DbSet<QuestionUserSave> QuestionUserSaves { get; private set; }
        public DbSet<QuestionUserLikeNotification> QuestionUserLikeNotifications { get; private set; }
        public DbSet<Exam> Exams { get; private set; }
        public DbSet<Subject> Subjects { get; private set; }
        public DbSet<SubjectTopic> SubjectTopics { get; private set; }
        public DbSet<Topic> Topics { get; private set; }

        public DbSet<Solution> Solutions { get; private set; }
        public DbSet<SolutionUserVote> SolutionUserVotes { get; private set; }
        public DbSet<SolutionUserSave> SolutionUserSaves { get; private set; }
        public DbSet<SolutionUserVoteNotification> SolutionUserVoteNotifications { get; private set; }

        public DbSet<Comment> Comments { get; private set; }
        public DbSet<CommentUserLike> CommentUserLikes { get; private set; }
        public DbSet<CommentUserLikeNotification> CommentUserLikeNotifications { get; private set; }
        public DbSet<CommentUserTag> CommentUserTags { get; private set; }

        public DbSet<Notification> Notifications { get; private set; }
        public DbSet<NotificationConnection> NotificationConnections { get; private set; }

        public DbSet<Message> Messages { get; private set; }
        public DbSet<MessageConnection> MessageConnections { get; private set; }

        public DbSet<AppVersion> AppVersions { get; private set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
            base.OnModelCreating(builder);
        }
    }

    public class AppDbContextFactory : IDesignTimeDbContextFactory<AppDbContext>
    {
        public AppDbContext CreateDbContext(string[] args)
        {
            var builder = new DbContextOptionsBuilder<AppDbContext>();
            builder.UseSqlServer("Data Source=THENQLV;Initial Catalog=SolTakeCom;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");
            return new AppDbContext(builder.Options);
        }
    }
}
