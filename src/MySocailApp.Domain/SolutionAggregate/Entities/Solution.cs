using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Domain.SolutionAggregate.Entities
{
    public class Solution : Entity, IAggregateRoot
    {
        public readonly static int MaxNumberOfMultimedia = 5;
        private Solution() { }

        public int QuestionId { get; private set; }
        public int UserId { get; private set; }
        public SolutionContent? Content { get; private set; } = null!;
        private readonly List<Multimedia> _medias = [];
        public IReadOnlyCollection<Multimedia> Medias => _medias;
        public bool IsCreatedByAI { get; private set; }
        public int? AIModelId { get; private set; }

        public Solution(int questionId, int userId, SolutionContent? content = null, IEnumerable<Multimedia>? medias = null)
        {
            if (content == null && (medias == null || !medias.Any()))
                throw new SolutionContentRequiredException();
            if (medias != null && medias.Count() > MaxNumberOfMultimedia)
                throw new TooManySolutionMediaException();

            QuestionId = questionId;
            UserId = userId;
            Content = content;
            State = SolutionState.Pending;
            IsCreatedByAI = false;
            _medias.AddRange(medias ?? []);
        }

        public Solution(int questionId, int userId, SolutionContent content, int aIModelId)
        {
            QuestionId = questionId;
            UserId = userId;
            Content = content;
            State = SolutionState.Pending;
            IsCreatedByAI = true;
            AIModelId = aIModelId;
        }

        public void Create() => CreatedAt = DateTime.UtcNow;
        
        public SolutionState State { get; private set; }
        internal void MarkAsCorrect(Question question, Login login)
        {
            if (State != SolutionState.Pending)
                throw new InvalidStateTransitionException();

            if (login.UserId != question.UserId)
                throw new PermissionDeniedToChangeStateOfSolution();

            State = SolutionState.Correct;
            UpdatedAt = DateTime.UtcNow;

            AddDomainEvent(new SolutionMarkedAsCorrectDomainEvent(question, this, login));
        }
        internal void MarkAsIncorrect(Question question, Login login)
        {
            if (State != SolutionState.Pending)
                throw new InvalidStateTransitionException();

            if (login.UserId != question.UserId)
                throw new PermissionDeniedToChangeStateOfSolution();

            State = SolutionState.Incorrect;
            UpdatedAt = DateTime.UtcNow;

            AddDomainEvent(new SolutionMarkedAsIncorrectDomainEvent(question, this, login));
        }


    }
}
