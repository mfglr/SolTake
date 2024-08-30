using MySocailApp.Application.Queries.ExamAggregate;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Queries.SubjectAggregate;
using MySocailApp.Application.Queries.TopicAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Infrastructure.Extetions.QueryableMappers
{
    public static class QuestionQueryableMappers
    {
        public static IQueryable<QuestionResponseDto> ToQuestionResponseDto(this IQueryable<Question> query, int accountId)
            => query
                .Select(x => new QuestionResponseDto(
                    x.Id,
                    x.CreatedAt,
                    x.UpdatedAt,
                    x.Solutions.Any(x => x.State == SolutionState.Correct) ? QuestionState.Solved : QuestionState.Unsolved,
                    x.AppUserId == accountId,
                    x.AppUserId,
                    x.AppUser.Account.UserName!,
                    x.Content,
                    x.Likes.Any(x => x.AppUserId == accountId),
                    x.Likes.Count,
                    x.Comments.Count,
                    x.Solutions.Count,
                    x.Solutions.Count(x => x.State == SolutionState.Correct),
                    new ExamResponseDto(
                        x.Exam.Id,
                        x.Exam.ShortName,
                        x.Exam.FullName
                    ),
                    new SubjectResponseDto(
                        x.Subject.Id,
                        x.Subject.ExamId,
                        x.Subject.Name
                    ),
                    x.Topics.Select(
                        t => new TopicResponseDto(
                            t.Topic.Id,
                            t.Topic.SubjectId,
                            t.Topic.Name
                        )
                    ),
                    x.Images.Select(
                        i => new QuestionImageResponseDto(
                            i.Id,
                            i.QuestionId,
                            i.BlobName,
                            i.Height,
                            i.Width
                        )
                    )
                ));
    }
}
