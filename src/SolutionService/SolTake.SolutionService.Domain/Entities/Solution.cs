using SolTake.Core;
using SolTake.SolutionService.Domain.Exceptions;
using SolTake.SolutionService.Domain.ValueObjects;

namespace SolTake.SolutionService.Domain.Entities
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
            _medias.AddRange(medias ?? []);
        }

        public Solution(int questionId, int userId, SolutionContent content, int aIModelId)
        {
            QuestionId = questionId;
            UserId = userId;
            Content = content;
            State = SolutionState.Pending;
            AIModelId = aIModelId;
        }

        public void Create() => CreatedAt = DateTime.UtcNow;
        
        public SolutionState State { get; private set; }
        
        public void MarkAsCorrect()
        {
            if (State != SolutionState.Pending)
                throw new InvalidStateTransitionException();
            State = SolutionState.Correct;
            UpdatedAt = DateTime.UtcNow;
        }

        public void MarkAsIncorrect()
        {
            if (State != SolutionState.Pending)
                throw new InvalidStateTransitionException();
            State = SolutionState.Incorrect;
            UpdatedAt = DateTime.UtcNow;
        }
    }
}
