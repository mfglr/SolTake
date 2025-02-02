using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public record QuestionResponseDto(int Id, DateTime CreatedAt, DateTime? UpdatedAt, QuestionState State, bool IsOwner, int UserId, string UserName, string? Content, bool IsLiked, bool IsSaved, int NumberOfLikes, int NumberOfComments, int NumberOfSolutions,int NumberOfCorrectSolutions, int NumberOfVideoSolutions, QuestionExam Exam, QuestionSubject Subject, QuestionTopic? Topic, IEnumerable<QuestionMultimediaResponseDto> Medias, Multimedia? Image, bool IsSolveableByAi);
    
}
