using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using SolTake.Domain.ExamAggregate.Entitities;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Entities;
using SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Entities;
using SolTake.Domain.PrivacyPolicyAggregate;
using SolTake.Domain.QuestionAggregate.Entities;
using SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Entities;
using SolTake.Domain.QuestionUserLikeAggregate.Entities;
using SolTake.Domain.RoleAggregate.Entities;
using SolTake.Domain.SolutionAggregate.Entities;
using SolTake.Domain.SolutionUserSaveAggregate.Entities;
using SolTake.Domain.SolutionUserVoteAggregate.Entities;
using SolTake.Domain.StoryAggregate.Entities;
using SolTake.Domain.StoryUserViewAggregate.Entities;
using SolTake.Domain.SubjectAggregate.Entities;
using SolTake.Domain.TermsOfUseAggregate;
using SolTake.Domain.TopicAggregate.Entities;
using SolTake.Domain.TransactionAggregate.Entities;
using SolTake.Domain.UserAggregate.Entities;
using SolTake.Domain.UserUserBlockAggregate.Entities;
using SolTake.Domain.UserUserConversationAggregate.Entities;
using SolTake.Domain.UserUserFollowAggregate.Entities;
using SolTake.Domain.UserUserSearchAggregate.Entities;
using SolTake.Domain.AIModelAggregate.Entities;
using SolTake.Domain.AppVersionAggregate.Entities;
using SolTake.Domain.BalanceAggregate.Entities;
using SolTake.Domain.CommentAggregate.Entities;
using SolTake.Domain.CommentUserLikeAggregate.Entities;
using SolTake.Domain.MessageAggregate.Entities;
using SolTake.Domain.MessageConnectionAggregate.Entities;
using SolTake.Domain.MessageUserReceiveAggregate.Entities;
using SolTake.Domain.MessageUserRemoveAggregate.Entities;
using SolTake.Domain.MessageUserViewAggregate.Entities;
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
        public DbSet<UserUserConversation> UserUserConversations { get; private set; }

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

        public DbSet<Balance> Balances { get; private set; }
        public DbSet<Transaction> Transactions { get; private set; }

        public DbSet<AIModel> AIModels { get; private set; }


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
