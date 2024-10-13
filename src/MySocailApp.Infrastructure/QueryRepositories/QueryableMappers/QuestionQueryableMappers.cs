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
        //public static IQueryable<QuestionResponseDto> ToQuestionResponseDto(this IQueryable<Question> query, int accountId)
        //    => query
        //        .Select(x => new QuestionResponseDto(
        //            x.Id,
        //            x.CreatedAt,
        //            x.UpdatedAt,
        //            x.Solutions.Any(x => x.State == SolutionState.Correct) ? QuestionState.Solved : QuestionState.Unsolved,
        //            x.AppUserId == accountId,
        //            x.AppUserId,
        //            x.AppUser.Account.UserName!,
        //            x.Content.Value,
        //            x.Likes.Any(x => x.AppUserId == accountId),
        //            x.Savers.Any(x => x.AppUserId == accountId),
        //            x.Likes.Count,
        //            x.Comments.Count,
        //            x.Solutions.Count,
        //            x.Solutions.Count(x => x.State == SolutionState.Correct),
        //            x.Solutions.Count(x => x.Video != null),
        //            new ExamResponseDto(
        //                x.Exam.Id,
        //                x.Exam.ShortName,
        //                x.Exam.FullName
        //            ),
        //            new SubjectResponseDto(
        //                x.Subject.Id,
        //                x.Subject.Name
        //            ),
        //            new TopicResponseDto(
        //                x.Topic.Id,
        //                x.Topic.Name
        //            ),
        //            x.Images.Select(
        //                i => new QuestionImageResponseDto(
        //                    i.Id,
        //                    i.QuestionId,
        //                    i.BlobName,
        //                    i.Height,
        //                    i.Width
        //                )
        //            )
        //        ));

        public static IQueryable<QuestionResponseDto> ToQuestionResponseDto(this IQueryable<Question> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users, q => q.AppUserId, a => a.Id,
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
