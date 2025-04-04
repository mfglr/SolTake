﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using MySocailApp.Domain.AppVersionAggregate.Entities;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.ExamAggregate.Entitities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.SubjectAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.TopicAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Entities;
using MySocailApp.Domain.UserDomain.FollowAggregate.Entities;
using MySocailApp.Domain.UserDomain.PrivacyPolicyAggregate;
using MySocailApp.Domain.UserDomain.RoleAggregate.Entities;
using MySocailApp.Domain.UserDomain.TermsOfUseAggregate;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserUserSearchAggregate.Entities;
using System.Reflection;

namespace MySocailApp.Infrastructure.DbContexts
{
    public class AppDbContext(DbContextOptions options) : DbContext(options)
    {
        public DbSet<PrivacyPolicy> PrivacyPolicies { get; private set; }
        public DbSet<TermsOfUse> TermsOfUses { get; private set; }

        public DbSet<User> Users { get; private set; }
        public DbSet<Follow> Follows { get; private set; }
        public DbSet<UserUserSearch> UserUserSearchs { get; private set; }
        public DbSet<Role> Roles { get; private set; }

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
