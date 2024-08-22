using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Domain.SolutionAggregate.Entities
{
    public class Solution : IPaginableAggregateRoot, IDomainEventsContainer
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
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
        
        private readonly List<SolutionUserVote> _votes = [];
        public IReadOnlyCollection<SolutionUserVote> Votes => _votes;
        public void MakeUpvote(int voterId)
        {
            if (AppUserId == voterId)
                throw new UnableToVoteForYourSolutions();

            var index = _votes.FindIndex(x => x.AppUserId == voterId);
            if (index != -1)
            {
                if (_votes[index].Type == SolutionVoteType.Upvote)
                    return;
                _votes.RemoveAt(index);//Remove downvote
            }
            _votes.Add(SolutionUserVote.GenerateUpvote(Id, voterId));
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
            _votes.Add(SolutionUserVote.GenerateDownvote(Id, voterId));
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
            State = SolutionState.Correct;
            UpdatedAt = DateTime.UtcNow;
            AddDomainEvent(new SolutionMarkedAsCorrectDomainEvent(this));
        }
        internal void MarkAsIncorrect()
        {
            State = SolutionState.Incorrect;
            UpdatedAt = DateTime.UtcNow;
            AddDomainEvent(new SolutionMarkedAsIncorrectDomainEvent(this));
        }

        internal void Delete()
        {
            _images.Clear();
            _votes.Clear();
        }
        //Readonluy navigator properties
        public Question Question { get; } = null!;
        public AppUser AppUser { get; } = null!;
        public IReadOnlyCollection<SolutionComment> Comments { get; } = null!;
        public IReadOnlyCollection<Notification> Notifications { get; } = null!;

        //IDomainEventsContainer
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
        public void ClearEvents() => _events.Clear();
    }
}
