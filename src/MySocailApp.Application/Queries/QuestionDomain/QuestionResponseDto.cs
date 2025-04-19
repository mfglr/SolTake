using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.QuestionDomain
{
    public record QuestionResponseDto(int Id, DateTime CreatedAt, DateTime? UpdatedAt, QuestionState State, bool IsOwner, int UserId, string UserName, string? Content, bool IsLiked, bool IsSaved, int NumberOfLikes, int NumberOfComments, int NumberOfSolutions, int NumberOfCorrectSolutions, int NumberOfVideoSolutions, QuestionExam Exam, QuestionSubject Subject, QuestionTopic? Topic, IEnumerable<Multimedia> Medias, Multimedia? Image);

}
