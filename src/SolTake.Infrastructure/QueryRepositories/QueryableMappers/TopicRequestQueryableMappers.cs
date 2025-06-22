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
                    (topicRequest, subject) => 
                        new TopicRequestResponseDto(
                            topicRequest.Id,
                            topicRequest.CreatedAt,
                            subject.Name,
                            topicRequest.Name.Value,
                            topicRequest.State,
                            topicRequest.Reason
                        )
                );
    }
}
