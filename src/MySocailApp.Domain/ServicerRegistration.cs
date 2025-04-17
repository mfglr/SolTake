using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.AppVersionAggregate;
using MySocailApp.Domain.CommentDomain.CommentAggregate;
using MySocailApp.Domain.MessageDomain.MessageAggregate;
using MySocailApp.Domain.QuestionDomain;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate;
using MySocailApp.Domain.StoryDomain;
using MySocailApp.Domain.UserDomain;

namespace MySocailApp.Domain
{
    public static class ServicerRegistration
    {
        public static IServiceCollection AddDomain(this IServiceCollection services)
            => services
                .AddAppVersionDomainServices()
                .AddCommentDomainServices()
                .AddQuestionDomain()
                .AddSolutionDomainServices()
                .AddUserDomain()
                .AddStoryDomainServices()
                .AddMessageDomainServices();
    }
}
