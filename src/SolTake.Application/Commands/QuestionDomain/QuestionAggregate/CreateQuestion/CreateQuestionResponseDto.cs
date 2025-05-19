using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.UserAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.CreateQuestion
{

    public class CreateQuestionResponseDto(Question question, User user)
    {
        public int Id { get; private set; } = question.Id;
        public DateTime CreatedAt { get; private set; } = question.CreatedAt;
        public DateTime? UpdatedAt { get; private set; } = question.UpdatedAt;
        public QuestionState State { get; private set; } = QuestionState.Unsolved;
        public bool IsOwner { get; private set; } = true;
        public int UserId { get; private set; } = question.UserId;
        public string UserName { get; private set; } = user.UserName.Value;
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
        public IEnumerable<Multimedia> Medias { get; private set; } = question.Medias;
        public Multimedia? Image { get; private set; } = user.Image;
    }
}
