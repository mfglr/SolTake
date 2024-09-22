using MySocailApp.Application.Queries.ExamAggregate;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Queries.SubjectAggregate;
using MySocailApp.Application.Queries.TopicAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionQueryableMappers
    {
        public static IQueryable<QuestionResponseDto> Join(this IQueryable<Question> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    q => q.AppUserId,
                    a => a.Id,
                    (q, a) => new QuestionResponseDto(
                        q.Id,
                        q.CreatedAt,
                        q.UpdatedAt,
                        context.Solutions.Any(s => q.Id == s.QuestionId && s.State == SolutionState.Correct) ? QuestionState.Solved : QuestionState.Unsolved,
                        q.AppUserId == accountId,
                        q.AppUserId,
                        a.UserName!,
                        q.Content.Value,
                        q.Likes.Any(x => x.AppUserId == accountId),
                        q.Saves.Any(x => x.AppUserId == accountId),
                        q.Likes.Count,
                        context.Comments.Count(x => x.QuestionId == q.Id),
                        context.Solutions.Count(x => x.QuestionId == q.Id),
                        context.Solutions.Count(x => x.QuestionId == q.Id && x.State == SolutionState.Correct),
                        new ExamResponseDto(
                            q.Exam.Id,
                            q.Exam.ShortName,
                            q.Exam.FullName
                        ),
                        new SubjectResponseDto(
                            q.Subject.Id,
                            q.Subject.ExamId,
                            q.Subject.Name
                        ),
                        q.Topics.Select(
                            t => new TopicResponseDto(
                                t.Topic.Id,
                                t.Topic.SubjectId,
                                t.Topic.Name
                            )
                        ),
                        q.Images.Select(
                            i => new QuestionImageResponseDto(
                                i.Id,
                                i.QuestionId,
                                i.BlobName,
                                i.Height,
                                i.Width
                            )
                        )
                    )
                );
    }
}
