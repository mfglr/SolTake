﻿using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.AppVersionAggregate;
using MySocailApp.Domain.CommentAggregate;
using MySocailApp.Domain.CommentUserLikeAggregate;
using MySocailApp.Domain.MessageDomain.MessageAggregate;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Domain.QuestionUserLikeAggregate;
using MySocailApp.Domain.QuestionUserSaveAggregate;
using MySocailApp.Domain.SolutionAggregate;
using MySocailApp.Domain.SolutionUserSaveAggregate;
using MySocailApp.Domain.SolutionUserVoteAggregate;
using MySocailApp.Domain.StoryUserViewAggregate;
using MySocailApp.Domain.UserAggregate;
using MySocailApp.Domain.UserUserBlockAggregate;
using MySocailApp.Domain.UserUserConversationAggregate;
using MySocailApp.Domain.UserUserFollowAggregate;
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
