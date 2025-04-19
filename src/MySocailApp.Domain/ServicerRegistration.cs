using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.AppVersionAggregate;
using MySocailApp.Domain.CommentAggregate;
using MySocailApp.Domain.CommentUserLikeAggregate;
using MySocailApp.Domain.MessageDomain.MessageAggregate;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Domain.QuestionUserLikeAggregate;
using MySocailApp.Domain.QuestionUserSaveAggregate;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate;
using MySocailApp.Domain.StoryDomain;
using MySocailApp.Domain.UserDomain;
using MySocailApp.Domain.UserUserSearchAggregate;

namespace MySocailApp.Domain
{
    public static class ServicerRegistration
    {
        public static IServiceCollection AddDomain(this IServiceCollection services)
            => services
                .AddAppVersionDomainServices()
                .AddCommentAggregateServices()
                .AddCommentUserLikeAggregateServices()
                .AddQuestionDomainServices()
                .AddQuestionUserLikeDomainServices()
                .AddQuestionUserSaveDomainServices()
                .AddSolutionDomainServices()
                .AddUserDomain()
                .AddUserUserSearchDomainServices()
                .AddStoryDomainServices()
                .AddMessageDomainServices();
    }
}
