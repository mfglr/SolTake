using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities
{
    public class Solution : Entity, IAggregateRoot
    {
        public static int MaxNumberOfMultimedia = 5;
        private Solution() { }

        public int QuestionId { get; private set; }
        public int UserId { get; private set; }
        public SolutionContent? Content { get; private set; } = null!;
        private readonly List<SolutionMultimedia> _medias = [];
        public IReadOnlyCollection<SolutionMultimedia> Medias => _medias;
        public bool IsCreatedByAI { get; private set; }
        public SolutionAIModel? Model { get; private set; }

        public static Solution CreateByUser(int questionId, int userId, SolutionContent? content = null, IEnumerable<SolutionMultimedia>? medias = null)
        {
            if (content == null && (medias == null || !medias.Any()))
                throw new SolutionContentRequiredException();
            if (medias != null && medias.Count() > MaxNumberOfMultimedia)
                throw new TooManySolutionMediaException();

            var solution = new Solution()
            {
                QuestionId = questionId,
                UserId = userId,
                Content = content,
                State = SolutionState.Pending,
                IsCreatedByAI = false,
                CreatedAt = DateTime.UtcNow
            };
            solution._medias.AddRange(medias ?? []);
            return solution;
        }

        public static Solution CreateByAI(int questionId, int userId, SolutionContent content, SolutionAIModel model)
        {
            var solution = new Solution()
            {
                QuestionId = questionId,
                UserId = userId,
                Content = content,
                State = SolutionState.Pending,
                IsCreatedByAI = true,
                Model = model,
                CreatedAt = DateTime.UtcNow
            };
            return solution;
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
