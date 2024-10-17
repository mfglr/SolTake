﻿using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.ExamAggregate.Entitities;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationConnectionAggregate.Entities;
using MySocailApp.Domain.PrivacyPolicyAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Entities;
using MySocailApp.Domain.TermsOfUseAggregate;
using MySocailApp.Domain.TopicAggregate.Entities;
using MySocailApp.Domain.UserConnectionAggregate.Entities;
using System.Reflection;

namespace MySocailApp.Infrastructure.DbContexts
{
    public class AppDbContext(DbContextOptions<AppDbContext> options) : IdentityDbContext<Account,IdentityRole<int>,int>(options)
    {
        public DbSet<AppUser> AppUsers { get; private set; }
        public DbSet<UserSearch> UserSearchs { get; private set; }
        public DbSet<Follow> Follows { get; private set; }

        public DbSet<Question> Questions { get; private set; }
        public DbSet<QuestionUserLike> QuestionUserLikes { get; private set; }
        public DbSet<QuestionUserSave> QuestionUserSaves { get; private set; }

        public DbSet<Comment> Comments { get; private set; }
        public DbSet<CommentUserLike> CommentUserLikes { get; private set; }

        public DbSet<Solution> Solutions { get; private set; }
        public DbSet<SolutionUserVote> SolutionUserVotes { get; private set; }
        public DbSet<SolutionUserSave> SolutionUserSaves { get; private set; }

        public DbSet<Exam> Exams { get; private set; }

        public DbSet<Subject> Subjects { get; private set; }
        public DbSet<SubjectTopic> SubjectTopics { get; private set; }

        public DbSet<Topic> Topics { get; private set; }

        public DbSet<Notification> Notifications { get; private set; }
        
        public DbSet<UserConnection> UserConnections { get; private set; }
        public DbSet<NotificationConnection> NotificationConnections { get; private set; }

        public DbSet<Message> Messages { get; private set; }
        public DbSet<MessageResponseDto> MessageResponseDtos { get; private set; }

        public DbSet<PrivacyPolicy> PrivacyPolicies { get; private set; }
        public DbSet<TermsOfUse> TermsOfUses { get; private set; }

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
