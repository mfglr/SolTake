using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Domain.SolutionAggregate.Entities
{
    public class Solution
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; }
        public string? Content { get; private set; }
        private readonly List<SolutionImage> _images = [];
        public IReadOnlyCollection<SolutionImage> Images => _images;

        internal void Create(int questionId, int appUserId, string? content, IEnumerable<SolutionImage> images)
        {
            if (images.Count() > 10)
                throw new TooManySolutionImageException();
            QuestionId = questionId;
            AppUserId = appUserId;
            Content = content;
            State = SolutionState.Pending;
            _images.AddRange(images);
            UpdatedAt = CreatedAt = DateTime.UtcNow;
        }

        public SolutionState State { get; private set; }
        internal void Approve()
        {
            if (State == SolutionState.Approved)
                return;

            State = SolutionState.Approved;
            UpdatedAt = DateTime.UtcNow;
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

        //Readonluy navigator properties
        public Question Question { get; }
        public AppUser AppUser { get; }
    }
}
