using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Domain.SolutionAggregate.Entities
{
    public class Solution : Entity, IAggregateRoot
    {
        private Solution() { }

        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; }
        public SolutionContent Content { get; private set; } = null!;
        public SolutionVideo? Video { get; private set; }
        public bool HasVideo { get; private set; }
        private readonly List<SolutionImage> _images = [];
        public IReadOnlyCollection<SolutionImage> Images => _images;

        public Solution(int questionId, int userId, SolutionContent content, IEnumerable<SolutionImage> images)
        {
            if ((content == null || content.Value.Trim() == "") && !images.Any())
                throw new SolutionContentRequiredException();
            if (images.Count() > 3)
                throw new TooManySolutionImageException();

            ArgumentNullException.ThrowIfNull(content);

            QuestionId = questionId;
            AppUserId = userId;
            Content = content;
            _images.AddRange(images);
            State = SolutionState.Pending;
        }
        public Solution(int questionId, int userId, SolutionContent content,SolutionVideo video)
        {
            ArgumentNullException.ThrowIfNull(content);
            ArgumentNullException.ThrowIfNull(video);

            QuestionId = questionId;
            AppUserId = userId;
            Content = content;
            Video = video;
            _images.Add(SolutionImage.Create(video.FrameBlobName,video.FrameHeight,video.FrameWidth));
            State = SolutionState.Pending;
        }
        internal void Create()
        {
            UpdatedAt = CreatedAt = DateTime.UtcNow;
            HasVideo = Video != null;
        }

        private readonly List<SolutionUserVote> _votes = [];
        public IReadOnlyCollection<SolutionUserVote> Votes => _votes;
        private readonly List<SolutionUserVoteNotification> _voteNotifications = [];
        public IReadOnlyCollection<SolutionUserVoteNotification> VoteNotifications => _voteNotifications;
        public SolutionUserVote MakeUpvote(int voterId)
        {
            var index = _votes.FindIndex(x => x.AppUserId == voterId);
            if (index != -1)
            {
                if (_votes[index].Type == SolutionVoteType.Upvote)
                    throw new SolutionUpvotedBeforeException();
                _votes.RemoveAt(index);//Remove downvote
                AddDomainEvent(new SolutionDownvoteRemovedDomainEvent(this));
            }
            
            var vote = SolutionUserVote.GenerateUpvote(voterId);
            _votes.Add(vote);

            if(AppUserId != voterId && !_voteNotifications.Any(x => x.AppUserId == voterId))
            {
                _voteNotifications.Add(new SolutionUserVoteNotification(voterId));
                AddDomainEvent(new SolutionWasUpvotedDomainEvent(this, vote));
            }
            return vote;
        }
        public SolutionUserVote MakeDownvote(int voterId)
        {
            var index = _votes.FindIndex(x => x.AppUserId == voterId);
            if (index != -1)
            {
                if (_votes[index].Type == SolutionVoteType.Downvote)
                    throw new SolutionDownvotedBeforeException();
                _votes.RemoveAt(index);//Remove upvote
                AddDomainEvent(new SolutionUpvoteRemovedDomainEvent(this));
            }
            
            var vote = SolutionUserVote.GenerateDownvote(voterId);
            _votes.Add(vote);

            if(AppUserId != voterId && !_voteNotifications.Any(x => x.AppUserId == voterId))
            {
                _voteNotifications.Add(new SolutionUserVoteNotification(voterId));
                AddDomainEvent(new SolutionWasDownvotedDomainEvent(this, vote));
            }
            return vote;
        }
        public void RemoveUpvote(int voterId)
        {
            int index = _votes.FindIndex(x => x.AppUserId == voterId);
            if (index == -1 || _votes[index].Type == SolutionVoteType.Downvote)
                throw new VoteIsNotFoundException();
            _votes.RemoveAt(index);
            AddDomainEvent(new SolutionUpvoteRemovedDomainEvent(this));
        }
        public void RemoveDownvote(int voterId)
        {
            int index = _votes.FindIndex(x => x.AppUserId == voterId);
            if(index == -1 || _votes[index].Type == SolutionVoteType.Upvote)
                throw new VoteIsNotFoundException();
            _votes.RemoveAt(index);
            AddDomainEvent(new SolutionDownvoteRemovedDomainEvent(this));
        }
        public void DeleteVote(int voterId)
        {
            int index = _votes.FindIndex(x => x.AppUserId == voterId);
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

        private readonly List<SolutionUserSave> _savers = [];
        public IReadOnlyCollection<SolutionUserSave> Savers => _savers;
        public SolutionUserSave Save(int saverId)
        {
            if (_savers.Any(x => x.AppUserId == saverId))
                throw new SolutionAlreadySavedException();
            var save = SolutionUserSave.Create(saverId);
            _savers.Add(save);
            return save;
        }
        public void Unsave(int saverId)
        {
            var index = _savers.FindIndex(x => x.AppUserId == saverId);
            if (index == -1) return;
            _savers.RemoveAt(index);
        }
    }
}
