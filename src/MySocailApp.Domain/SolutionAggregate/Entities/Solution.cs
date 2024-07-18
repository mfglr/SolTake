using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.QuestionAggregate;
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
        public void ApproveSolution()
        {
            State = SolutionState.Approved;
            UpdatedAt = DateTime.UtcNow;
        }
        public void RejectSolution()
        {
            State = SolutionState.Rejected;
            UpdatedAt = DateTime.UtcNow;
        }

        private readonly List<SolutionUserVote> _votes = [];
        public IReadOnlyCollection<SolutionUserVote> Votes => _votes;
        public void MakeUpvote(int appUserId)
        {
            var index = _votes.FindIndex(x => x.AppUserId == appUserId);
            if (index != -1)
            {
                if (_votes[index].Type == SolutionVoteType.Upvote)
                    return;
                _votes.RemoveAt(index);//Remove rejected vote
            }
            _votes.Add(SolutionUserVote.GenerateUpvote(Id, appUserId));
        }
        public void MakeDownvote(int appUserId)
        {
            var index = _votes.FindIndex(x => x.AppUserId == appUserId);
            if (index != -1)
            {
                if (_votes[index].Type == SolutionVoteType.Downvote)
                    return;
                _votes.RemoveAt(index);//Remove approved vote
            }
            _votes.Add(SolutionUserVote.GenerateDownvote(Id, appUserId));
        }

        //Readonluy navigator properties
        public Question Question { get; }
        public AppUser AppUser { get; }
    }
}
