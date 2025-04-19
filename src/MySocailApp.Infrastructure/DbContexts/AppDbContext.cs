using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using MySocailApp.Domain.AppVersionAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentUserLikeAggregate.Entities;
using MySocailApp.Domain.ExamAggregate.Entitities;
using MySocailApp.Domain.MessageConnectionAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageUserReceiveAggregate.Entities;
using MySocailApp.Domain.MessageUserRemoveAggregate.Entities;
using MySocailApp.Domain.MessageUserViewAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Entities;
using MySocailApp.Domain.PrivacyPolicyAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Entities;
using MySocailApp.Domain.QuestionUserLikeAggregate.Entities;
using MySocailApp.Domain.RoleAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionUserSaveAggregate.Entities;
using MySocailApp.Domain.SolutionUserVoteAggregate.Entities;
using MySocailApp.Domain.StoryDomain.StoryAggregate.Entities;
using MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Entities;
using MySocailApp.Domain.TermsOfUseAggregate;
using MySocailApp.Domain.TopicAggregate.Entities;
using MySocailApp.Domain.UserAggregate.Entities;
using MySocailApp.Domain.UserUserBlockAggregate.Entities;
using MySocailApp.Domain.UserUserFollowAggregate.Entities;
using MySocailApp.Domain.UserUserSearchAggregate.Entities;
using System.Reflection;

namespace MySocailApp.Infrastructure.DbContexts
{
    public class AppDbContext(DbContextOptions options) : DbContext(options)
    {
        public DbSet<PrivacyPolicy> PrivacyPolicies { get; private set; }
        public DbSet<TermsOfUse> TermsOfUses { get; private set; }

        public DbSet<User> Users { get; private set; }
        public DbSet<UserUserFollow> UserUserFollows { get; private set; }
        public DbSet<UserUserSearch> UserUserSearchs { get; private set; }
        public DbSet<Role> Roles { get; private set; }
        public DbSet<UserUserBlock> UserUserBlocks { get; private set; }

        public DbSet<Exam> Exams { get; private set; }
        public DbSet<Subject> Subjects { get; private set; }
        public DbSet<SubjectTopic> SubjectTopics { get; private set; }
        public DbSet<Topic> Topics { get; private set; }

        public DbSet<Question> Questions { get; private set; }
        public DbSet<QuestionUserLike> QuestionUserLikes { get; private set; }
        public DbSet<QuestionUserSave> QuestionUserSaves { get; private set; }

        public DbSet<Solution> Solutions { get; private set; }

        public DbSet<SolutionUserVote> SolutionUserVotes { get; private set; }
        
        public DbSet<SolutionUserSave> SolutionUserSaves { get; private set; }

        public DbSet<Comment> Comments { get; private set; }
        public DbSet<CommentUserLike> CommentUserLikes { get; private set; }

        public DbSet<Notification> Notifications { get; private set; }
        public DbSet<NotificationConnection> NotificationConnections { get; private set; }

        public DbSet<Message> Messages { get; private set; }
        public DbSet<MessageUserRemove> MessageUserRemoves { get; private set; }
        public DbSet<MessageConnection> MessageConnections { get; private set; }
        public DbSet<MessageUserReceive> MessageUserReceives { get; private set; }
        public DbSet<MessageUserView> MessageUserViews { get; private set; }

        public DbSet<AppVersion> AppVersions { get; private set; }

        public DbSet<Story> Stories { get; private set; }
        public DbSet<StoryUserView> StoryUserViews { get; private set; }


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
