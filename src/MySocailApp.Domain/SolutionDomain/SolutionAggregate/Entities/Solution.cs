using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents;
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

        private readonly List<SolutionUserVote> _votes = [];
        public IReadOnlyCollection<SolutionUserVote> Votes => _votes;
        private readonly List<SolutionUserVoteNotification> _voteNotifications = [];
        public IReadOnlyCollection<SolutionUserVoteNotification> VoteNotifications => _voteNotifications;
        public SolutionUserVote MakeUpvote(int voterId)
        {
            var index = _votes.FindIndex(x => x.UserId == voterId);
            if (index != -1)
            {
                if (_votes[index].Type == SolutionVoteType.Upvote)
                    throw new SolutionUpvotedBeforeException();
                _votes.RemoveAt(index);//Remove downvote
                AddDomainEvent(new SolutionDownvoteRemovedDomainEvent(this));
            }

            var vote = SolutionUserVote.GenerateUpvote(voterId);
            _votes.Add(vote);

            if (UserId != voterId && !_voteNotifications.Any(x => x.UserId == voterId))
            {
                _voteNotifications.Add(new SolutionUserVoteNotification(voterId));
                AddDomainEvent(new SolutionWasUpvotedDomainEvent(this, vote));
            }
            return vote;
        }
        public SolutionUserVote MakeDownvote(int voterId)
        {
            var index = _votes.FindIndex(x => x.UserId == voterId);
            if (index != -1)
            {
                if (_votes[index].Type == SolutionVoteType.Downvote)
                    throw new SolutionDownvotedBeforeException();
                _votes.RemoveAt(index);//Remove upvote
                AddDomainEvent(new SolutionUpvoteRemovedDomainEvent(this));
            }

            var vote = SolutionUserVote.GenerateDownvote(voterId);
            _votes.Add(vote);

            if (UserId != voterId && !_voteNotifications.Any(x => x.UserId == voterId))
            {
                _voteNotifications.Add(new SolutionUserVoteNotification(voterId));
                AddDomainEvent(new SolutionWasDownvotedDomainEvent(this, vote));
            }
            return vote;
        }
        public void RemoveUpvote(int voterId)
        {
            int index = _votes.FindIndex(x => x.UserId == voterId);
            if (index == -1 || _votes[index].Type == SolutionVoteType.Downvote)
                throw new VoteIsNotFoundException();
            _votes.RemoveAt(index);
            AddDomainEvent(new SolutionUpvoteRemovedDomainEvent(this));
        }
        public void RemoveDownvote(int voterId)
        {
            int index = _votes.FindIndex(x => x.UserId == voterId);
            if (index == -1 || _votes[index].Type == SolutionVoteType.Upvote)
                throw new VoteIsNotFoundException();
            _votes.RemoveAt(index);
            AddDomainEvent(new SolutionDownvoteRemovedDomainEvent(this));
        }
        public void DeleteVote(int voterId)
        {
            int index = _votes.FindIndex(x => x.UserId == voterId);
            if (index == -1) return;
            _votes.RemoveAt(index);
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
