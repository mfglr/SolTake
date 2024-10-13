using MySocailApp.Application.Queries.ExamAggregate;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Queries.SubjectAggregate;
using MySocailApp.Application.Queries.TopicAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionUserSaveQueryableMappers
    {
        public static IQueryable<QuestionUserSaveResponseDto> ToQuestionUserSaveResponseDto(this IQueryable<QuestionUserSave> query, int accountId) =>
            query
                .Select(x => new QuestionUserSaveResponseDto(
                    x.Id,
                    x.CreatedAt,
                    x.QuestionId,
                    x.AppUserId,
                    new QuestionResponseDto(
                        x.Question.Id,
                        x.Question.CreatedAt,
                        x.Question.UpdatedAt,
                        x.Question.Solutions.Any(x => x.State == SolutionState.Correct) ? QuestionState.Solved : QuestionState.Unsolved,
                        x.Question.AppUserId == accountId,
                        x.Question.AppUserId,
                        x.Question.AppUser.Account.UserName!,
                        x.Question.Content.Value,
                        x.Question.Likes.Any(x => x.AppUserId == accountId),
                        x.Question.Savers.Any(x => x.AppUserId == accountId),
                        x.Question.Likes.Count,
                        x.Question.Comments.Count,
                        x.Question.Solutions.Count,
                        x.Question.Solutions.Count(x => x.State == SolutionState.Correct),
                        x.Question.Solutions.Count(x => x.Video != null),
                        new ExamResponseDto(
                            x.Question.Exam.Id,
                            x.Question.Exam.ShortName,
                            x.Question.Exam.FullName
                        ),
                        new SubjectResponseDto(
                            x.Question.Subject.Id,
                            x.Question.Subject.Name
                        ),
                        new TopicResponseDto(
                            x.Question.Topic.Id,
                            x.Question.Topic.Name
                        ),
                        x.Question.Images.Select(
                            i => new QuestionImageResponseDto(
                                i.Id,
                                i.QuestionId,
                                i.BlobName,
                                i.Height,
                                i.Width
                            )
                        )
                    )
                ));
    }
}
