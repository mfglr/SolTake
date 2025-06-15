using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.TopicRequestAggregate;
using SolTake.Domain.TopicRequestAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class TopicRequestQueryableMappers
    {
        public static IQueryable<TopicRequestResponseDto> ToTopicRequestResponseDto(this IQueryable<TopicRequest> topicRequests,AppDbContext context)
            => topicRequests
                .Join(
                    context.Subjects,
                    topicRequest => topicRequest.SubjectId,
                    subject => subject.Id,
                    (topicRequest, subject) => new { topicRequest, subject }
                )
                .Select(
                    join =>
                        new TopicRequestResponseDto(
                            join.topicRequest.Id,
                            join.topicRequest.SubjectId,
                            join.subject.Name,
                            join.topicRequest.Name
                        )
                );
    }
}
