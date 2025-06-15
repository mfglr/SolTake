using Microsoft.Extensions.DependencyInjection;
using SolTake.Application.QueryRepositories;

namespace SolTake.Infrastructure.QueryRepositories
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQueryRepositories(this IServiceCollection services)
            => services
                .AddScoped<IUserQueryRepository, UserQueryRepository>()
                .AddScoped<ICommentUserLikeQueryRepository, CommentUserLikeQueryRepository>()
                .AddScoped<IFollowQueryRepository, FollowQueryRepository>()
                .AddScoped<IUserUserSearchQueryRepository, UserUserSearchedQueryRepository>()
                .AddScoped<IQuestionQueryRepository, QuestionQueryRepository>()
                .AddScoped<IQuestionUserLikeQueryRepository, QuestionUserLikeQueryRepository>()
                .AddScoped<IQuestionUserSaveQueryRepository, QuestionUserSaveQueryRepository>()
                .AddScoped<ISolutionQueryRepository, SolutionQueryRepository>()
                .AddScoped<ICommentQueryRepository, CommentQueryRepository>()
                .AddScoped<ISolutionUserVoteQueryRepository, SolutionUserVoteQueryRepository>()
                .AddScoped<IMessageQueryRepository, MessageQueryRepository>()
                .AddScoped<ITopicQueryRepository, TopicQueryRepository>()
                .AddScoped<ISubjectQueryRepository, SubjectQueryRepository>()
                .AddScoped<ISolutionUserSaveQueryRepository, SolutionUserSaveQueryRepository>()
                .AddScoped<INotificationQueryRepository, NotificationQueryRepository>()
                .AddScoped<IMessageConnectionQueryRepository, MessageConnectionQueryRepository>()
                .AddScoped<IStoryQueryRepository, StoryQueryRepository>()
                .AddScoped<IStoryUserViewQueryRepository,StoryUserViewQueryRepository>()
                .AddScoped<IUserUserBlockQueryRepository,UserUserBlockQueryRepository>()
                .AddScoped<IUserUserConversationQueryRepository, UserUserConversationQueryRepository>()
                .AddScoped<IBalanceQueryRepository,BalanceQueryRepository>()
                .AddScoped<IAIModelQueryRepository,AIModelQueryRepository>()
                .AddScoped<ITransactionQueryRepository, TransactionQueryRepository>()
                .AddScoped<ITopicRequestQueryRepository, TopicRequestQueryRepository>()
                .AddScoped<IExamQueryRepository,ExamQueryRepository>()
                .AddScoped<IExamRequestQueryRepository,ExamRequestQueryRepository>();
    }
}
