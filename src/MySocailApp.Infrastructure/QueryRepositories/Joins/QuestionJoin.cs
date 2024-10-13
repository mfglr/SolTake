using MySocailApp.Application.Queries.ExamAggregate;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Queries.SubjectAggregate;
using MySocailApp.Application.Queries.TopicAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.Joins
{
    public static class QuestionJoin
    {
        public static IQueryable<QuestionResponseDto> ToQuestionResponseDto(this IQueryable<Question> query,AppDbContext context,int accountId)
            =>query
                .Join(
                    context.Users,q => q.AppUserId,a => a.Id,
                    (q, a) => new QuestionResponseDto(
                        q.Id,
                        q.CreatedAt,
                        q.UpdatedAt,
                        context.Solutions.Any(x => x.QuestionId == q.Id && x.State == SolutionState.Correct) ? QuestionState.Solved : QuestionState.Unsolved,
                        q.AppUserId == accountId,
                        q.AppUserId,
                        a.UserName!,
                        q.Content.Value,
                        context.QuestionUserLikes.Any(x => x.QuestionId == q.Id && q.AppUserId == accountId),
                        context.QuestionUserSaves.Any(x => x.QuestionId == q.Id && q.AppUserId == accountId),
                        context.QuestionUserLikes.Count(x => x.QuestionId == q.Id),
                        context.Comments.Count(x => x.QuestionId == q.Id),
                        context.Solutions.Count(x => x.QuestionId == q.Id),
                        context.Solutions.Count(x => x.QuestionId == q.Id && x.State == SolutionState.Correct),
                        context.Solutions.Count(x => x.Video != null),
                        new ExamResponseDto(
                            q.Exam.Id,
                            q.Exam.ShortName,
                            q.Exam.FullName
                        ),
                        new SubjectResponseDto(
                            q.Subject.Id,
                            q.Subject.Name
                        ),
                        new TopicResponseDto(
                            q.Topic.Id,
                            q.Topic.Name
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
