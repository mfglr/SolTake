using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Domain.SolutionAggregate.Entities
{
    public class Solution : Entity, IAggregateRoot
    {
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; }
        public SolutionContent? Content { get; private set; }
        private readonly List<SolutionImage> _images = [];
        public IReadOnlyCollection<SolutionImage> Images => _images;

        internal void Create(int questionId, int appUserId, SolutionContent? content, IEnumerable<SolutionImage> images)
        {
            if(content == null && !images.Any())
                throw new SolutionContentOrImagesRequiredException();
            if (images.Count() > 10)
                throw new TooManySolutionImageException();

            QuestionId = questionId;
            AppUserId = appUserId;
            Content = content;
            State = SolutionState.Pending;
            _images.AddRange(images);
            UpdatedAt = CreatedAt = DateTime.UtcNow;

            AddDomainEvent(new SolutionCreatedDomainEvent(this));
        }
        
        internal void Delete()
        {
            foreach(var comment in Comments)
                comment.Delete();
        }

        private readonly List<SolutionUserVote> _votes = [];
        public IReadOnlyCollection<SolutionUserVote> Votes => _votes;
        public SolutionUserVote MakeUpvote(int voterId)
        {
            if (AppUserId == voterId)
                throw new UnableToVoteForYourSolutions();

            var index = _votes.FindIndex(x => x.AppUserId == voterId);
            if (index != -1)
            {
                if (_votes[index].Type == SolutionVoteType.Upvote)
                    throw new SolutionUpvotedBeforeException();
                _votes.RemoveAt(index);//Remove downvote
            }
            var vote = SolutionUserVote.GenerateUpvote(voterId);
            _votes.Add(vote);
            AddDomainEvent(new SolutionWasUpvotedDomainEvent(this,voterId));

            return vote;

        }
        public void MakeDownvote(int voterId)
        {
            if (AppUserId == voterId)
                throw new UnableToVoteForYourSolutions();

            var index = _votes.FindIndex(x => x.AppUserId == voterId);
            if (index != -1)
            {
                if (_votes[index].Type == SolutionVoteType.Downvote)
                    return;
                _votes.RemoveAt(index);//Remove upvote
            }
            _votes.Add(SolutionUserVote.GenerateDownvote(voterId));
            AddDomainEvent(new SolutionWasDownvotedDomainEvent(this, voterId));
        }
        public void RemoveUpvote(int voterId)
        {
            int index = _votes.FindIndex(x => x.AppUserId == voterId);
            if (index == -1 || _votes[index].Type == SolutionVoteType.Downvote)
                throw new VoteIsNotFoundException();
            _votes.RemoveAt(index);
        }
        public void RemoveDownvote(int voterId)
        {
            int index = _votes.FindIndex(x => x.AppUserId == voterId);
            if(index == -1 || _votes[index].Type == SolutionVoteType.Upvote)
                throw new VoteIsNotFoundException();
            _votes.RemoveAt(index);
        }

        public SolutionState State { get; private set; }
        internal void MarkAsCorrect()
        {
            if (State != SolutionState.Pending)
                throw new InvalidStateTransitionException();
            State = SolutionState.Correct;
            UpdatedAt = DateTime.UtcNow;
            AddDomainEvent(new SolutionMarkedAsCorrectDomainEvent(this));
        }
        internal void MarkAsIncorrect()
        {
            if (State != SolutionState.Pending)
                throw new InvalidStateTransitionException();
            State = SolutionState.Incorrect;
            UpdatedAt = DateTime.UtcNow;
            AddDomainEvent(new SolutionMarkedAsIncorrectDomainEvent(this));
        }

        //Readonly navigator properties
        public Question Question { get; } = null!;
        public AppUser AppUser { get; } = null!;
        private readonly List<Comment> _comments = [];
        public IReadOnlyList<Comment> Comments => _comments;

    }
}
