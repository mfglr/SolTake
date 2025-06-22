using SolTake.Application.Queries.TopicAggregate;
using SolTake.Domain.SubjectTopicAggregate.Entities;
using SolTake.Domain.TopicAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class TopicQueryableMappers
    {
        public static IQueryable<TopicResponseDto> ToTopicResponseDto(this IQueryable<Topic> query)
            => query
                .Select(x => new TopicResponseDto(x.Id,x.Name));

        public static IQueryable<TopicResponseDto> ToTopicResponseDto(this IQueryable<SubjectTopic> query, AppDbContext context)
            => query
                .Join(
                    context.Topics,
                    subjectTopic => subjectTopic.TopicId,
                    topic => topic.Id,
                    (subjectTopic,topic) => topic
                )
                .Select(x => new TopicResponseDto(x.Id, x.Name));
    }
}
