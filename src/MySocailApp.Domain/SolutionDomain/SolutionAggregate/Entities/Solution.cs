using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities
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
        public SolutionAIModel? Model { get; private set; }

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

        public Solution(int questionId, int userId, SolutionContent content, SolutionAIModel model)
        {
            QuestionId = questionId;
            UserId = userId;
            Content = content;
            State = SolutionState.Pending;
            IsCreatedByAI = true;
            Model = model;
        }

        public void Create(Question question, Login login)
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new SolutionCreatedDomainEvent(question,this,login));
        }

        public SolutionState State { get; private set; }
        internal void MarkAsCorrect()
        {
            if (State != SolutionState.Pending)
                throw new InvalidStateTransitionException();

            State = SolutionState.Correct;
            UpdatedAt = DateTime.UtcNow;
        }
        internal void MarkAsIncorrect()
        {
            if (State != SolutionState.Pending)
                throw new InvalidStateTransitionException();
            State = SolutionState.Incorrect;
            UpdatedAt = DateTime.UtcNow;
        }
    }
}
