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
    public static class QuestionUserSaveQueryableMappers
    {
        public static IQueryable<QuestionUserSaveResponseDto> Join(this IQueryable<QuestionUserSave> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Questions,
                    qus => qus.QuestionId,
                    q => q.Id,
                    (qus,q) => new { qus,q }
                )
                .Join(
                    context.Users,
                    j => j.q.AppUserId,
                    a => a.Id,
                    (j, a) => new QuestionUserSaveResponseDto(
                        j.qus.Id,
                        j.qus.CreatedAt,
                        j.qus.QuestionId,
                        j.qus.AppUserId,
                        new(
                            j.q.Id,
                            j.q.CreatedAt,
                            j.q.UpdatedAt,
                            context.Solutions.Any(s => j.q.Id == s.QuestionId && s.State == SolutionState.Correct) ? QuestionState.Solved : QuestionState.Unsolved,
                            j.q.AppUserId == accountId,
                            j.q.AppUserId,
                            a.UserName!,
                            j.q.Content.Value,
                            j.q.Likes.Any(l => l.AppUserId == accountId),
                            j.q.Saves.Any(s => s.AppUserId == accountId),
                            j.q.Likes.Count,
                            context.Comments.Count(c => c.QuestionId == j.q.Id),
                            context.Solutions.Count(s => s.QuestionId == j.q.Id),
                            context.Solutions.Count(s => s.QuestionId == j.q.Id && s.State == SolutionState.Correct),
                            new ExamResponseDto(
                                j.q.Exam.Id,
                                j.q.Exam.ShortName,
                                j.q.Exam.FullName
                            ),
                            new SubjectResponseDto(
                                j.q.Subject.Id,
                                j.q.Subject.ExamId,
                                j.q.Subject.Name
                            ),
                            j.q.Topics.Select(
                                t => new TopicResponseDto(
                                    t.Topic.Id,
                                    t.Topic.SubjectId,
                                    t.Topic.Name
                                )
                            ),
                            j.q.Images.Select(
                                i => new QuestionImageResponseDto(
                                    i.Id,
                                    i.QuestionId,
                                    i.BlobName,
                                    i.Height,
                                    i.Width
                                )
                            )
                        )
                    )
                );
    }
}
