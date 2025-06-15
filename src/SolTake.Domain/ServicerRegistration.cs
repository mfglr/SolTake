using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.SolutionUserSaveAggregate;
using MySocailApp.Domain.UserUserBlockAggregate;
using SolTake.Domain.AppVersionAggregate;
using SolTake.Domain.CommentAggregate;
using SolTake.Domain.CommentUserLikeAggregate;
using SolTake.Domain.MessageAggregate;
using SolTake.Domain.QuestionUserLikeAggregate;
using SolTake.Domain.QuestionUserSaveAggregate;
using SolTake.Domain.SolutionAggregate;
using SolTake.Domain.SolutionUserVoteAggregate;
using SolTake.Domain.StoryUserViewAggregate;
using SolTake.Domain.UserAggregate;
using SolTake.Domain.UserUserConversationAggregate;
using SolTake.Domain.UserUserFollowAggregate;
using SolTake.Domain.UserUserSearchAggregate;

namespace SolTake.Domain
{
    public static class ServicerRegistration
    {
        public static IServiceCollection AddDomain(this IServiceCollection services)
            => services
                .AddAppVersionDomainServices()
                
                .AddCommentAggregateServices()
                .AddCommentUserLikeAggregateServices()
                
                .AddQuestionUserLikeDomainServices()
                .AddQuestionUserSaveDomainServices()

                .AddSolutionDomainServices()
                .AddSolutionUserSaveDomainServices()
                .AddSolutionUserVoteDomainServices()

                .AddUserDomainServices()
                .AddUserUserBlockAggregateServices()
                .AddUserUserFollowAggregate()
                .AddUserUserSearchDomainServices()
                .AddUserUserConversationDomainServices()

                .AddStoryUserViewDomainServices()
                .AddMessageDomainServices();
    }
}
