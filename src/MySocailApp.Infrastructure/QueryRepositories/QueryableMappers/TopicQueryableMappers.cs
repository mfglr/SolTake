using MySocailApp.Application.Queries.TopicAggregate;
using MySocailApp.Domain.TopicAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class TopicQueryableMappers
    {
        public static IQueryable<TopicResponseDto> ToTopicResponseDto(this IQueryable<Topic> query)
            => query.Select(x => new TopicResponseDto(x.Id,x.SubjectId,x.Name));
    }
}
