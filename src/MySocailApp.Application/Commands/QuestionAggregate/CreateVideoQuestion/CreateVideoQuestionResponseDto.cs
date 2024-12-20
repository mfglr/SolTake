using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateVideoQuestion
{
    public class CreateVideoQuestionResponseDto(Question question, Account account)
    {
        public int Id { get; private set; } = question.Id;
        public DateTime CreatedAt { get; private set; } = question.CreatedAt;
        public DateTime? UpdatedAt { get; private set; } = question.UpdatedAt;
        public QuestionState State { get; private set; } = QuestionState.Unsolved;
        public bool IsOwner { get; private set; } = true;
        public int AppUserId { get; private set; } = question.UserId;
        public string UserName { get; private set; } = account.UserName.Value;
        public string? Content { get; private set; } = question.Content?.Value;
        public bool IsLiked { get; private set; } = false;
        public bool IsSaved { get; private set; } = false;
        public int NumberOfLikes { get; private set; } = 0;
        public int NumberOfComments { get; private set; } = 0;
        public int NumberOfSolutions { get; private set; } = 0;
        public QuestionExam Exam { get; private set; } = question.Exam;
        public QuestionSubject Subject { get; private set; } = question.Subject;
        public QuestionTopic? Topic { get; private set; } = question.Topic;
        public IEnumerable<QuestionMultimediaResponseDto> Medias { get; private set; } = question.Medias
                .Select(x => new QuestionMultimediaResponseDto(
                    x.Id,
                    x.QuestionId,
                    x.ContainerName,
                    x.BlobName,
                    x.Size,
                    x.Height,
                    x.Width,
                    x.Duration,
                    x.MultimediaType
                ));
    }
}
