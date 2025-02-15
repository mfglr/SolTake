using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.AppVersionAggregate;
using MySocailApp.Domain.CommentAggregate;
using MySocailApp.Domain.MessageDomain;
using MySocailApp.Domain.QuestionDomain;
using MySocailApp.Domain.SolutionAggregate;
using MySocailApp.Domain.UserDomain;

namespace MySocailApp.Domain
{
    public static class ServicerRegistration
    {
        public static IServiceCollection AddDomain(this IServiceCollection services)
            => services
                .AddAppVersionDomainServices()
                .AddCommentDomainServices()
                .AddMessageDomain()
                .AddQuestionDomain()
                .AddSolutionDomainServices()
                .AddUserDomain();
    }
}
