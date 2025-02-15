using AccountDomain.AccountAggregate.Entities;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.CreateQuestion
{

    public class CreateQuestionResponseDto(Question question, Account account)
    {
        public int Id { get; private set; } = question.Id;
        public DateTime CreatedAt { get; private set; } = question.CreatedAt;
        public DateTime? UpdatedAt { get; private set; } = question.UpdatedAt;
        public QuestionState State { get; private set; } = QuestionState.Unsolved;
        public bool IsOwner { get; private set; } = true;
        public int UserId { get; private set; } = question.UserId;
        public string UserName { get; private set; } = account.UserName.Value;
        public string? Content { get; private set; } = question.Content?.Value;
        public bool IsLiked { get; private set; } = false;
        public bool IsSaved { get; private set; } = false;
        public int NumberOfLikes { get; private set; } = 0;
        public int NumberOfComments { get; private set; } = 0;
        public int NumberOfSolutions { get; private set; } = 0;
        public int NumberOfVideoSolutions { get; private set; } = 0;
        public int NumberOfCorrectSolutions { get; private set; } = 0;
        public QuestionExam Exam { get; private set; } = question.Exam;
        public QuestionSubject Subject { get; private set; } = question.Subject;
        public QuestionTopic? Topic { get; private set; } = question.Topic;
        public IEnumerable<QuestionMultimediaResponseDto> Medias { get; private set; } = question.Medias
                .Select(x => new QuestionMultimediaResponseDto(
                    x.Id,
                    x.QuestionId,
                    x.ContainerName,
                    x.BlobName,
                    x.BlobNameOfFrame,
                    x.Size,
                    x.Height,
                    x.Width,
                    x.Duration,
                    x.MultimediaType
                ));
    }
}
