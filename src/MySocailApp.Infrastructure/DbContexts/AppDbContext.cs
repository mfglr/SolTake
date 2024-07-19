using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.ExamAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate;
using MySocailApp.Domain.TopicAggregate;
using System.Reflection;

namespace MySocailApp.Infrastructure.DbContexts
{
    public class AppDbContext(DbContextOptions<AppDbContext> options) : IdentityDbContext<Account,IdentityRole<int>,int>(options)
    {
        public DbSet<AppUser> AppUsers { get; private set; }
        public DbSet<Question> Questions { get; private set; }
        public DbSet<Exam> Exams { get; private set; }
        public DbSet<Subject> Subjects { get; private set; }
        public DbSet<Solution> Solutions { get; private set; }
        public DbSet<Topic> Topics { get; private set; }

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
            builder.UseSqlServer("Data Source=THENQLV;Initial Catalog=MySocialAppDb;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");
            return new AppDbContext(builder.Options);

        }
    }
}
