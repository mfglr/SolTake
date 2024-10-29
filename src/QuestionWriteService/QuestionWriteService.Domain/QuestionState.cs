using QuestionWriteService.Domain.ValuObjects;

namespace QuestionWriteService.Domain
{
    public class QuestionState
    {
        public readonly static int MaxImageCountPerQuestion = 3;

        public UserId UserId { get; private set; }
        public QuestionExam Exam { get; private set; }
        public QuestionSubject Subject { get; private set; }
        public IReadOnlyCollection<QuestionTopic> Topics => _topics;
        public QuestionContent Content { get; private set; }
        public IReadOnlyCollection<QuestionImage> Images => _images;
        public IReadOnlyCollection<UserId> Likers => _likers;
        public IReadOnlyCollection<UserId> Savers => _savers;
        public int NumberOfSolutions { get; private set; }
        public int NumberOfCorrectSolutions { get; private set; }
        public int NumberOfComments { get; private set; }
        public int NumberOfLikes => Likers.Count();
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }

        private readonly List<QuestionTopic> _topics = [];
        private readonly List<QuestionImage> _images = [];
        private readonly List<UserId> _likers = [];
        private readonly List<UserId> _savers = [];

        public QuestionState(UserId userId, QuestionExam exam, QuestionSubject subject, IEnumerable<QuestionTopic>? topics, QuestionContent content, IEnumerable<QuestionImage> images)
        {

            if (!images.Any())
                throw new QuestionImageRequiredException();
            if (images.Count() > MaxImageCountPerQuestion)
                throw new TooManyQuestionImagesException();

            UserId = userId;
            Exam = exam;
            Subject = subject;
            _topics = (topics ?? []).ToList();
            Content = content;
            _images = images.ToList();
            _likers = [];
            _savers = [];
        }
        public void Create() => CreatedAt = UpdatedAt = DateTime.UtcNow;

        public bool Like(UserId userId)
        {
            if (Likers.Any(x => x == userId)) return false;
            _likers.Add(userId);
            return true;
        }
        public bool Dislike(UserId userId)
        {
            var index = _likers.FindIndex(x => x == userId);
            if (index == -1) return false;
            _likers.RemoveAt(index);
            return true;
        }

        public bool Save(UserId userId)
        {
            if (Savers.Any(x => x == userId)) return false;
            _savers.Add(userId);
            return true;
        }
        public bool Unsave(UserId userId) {
            var index = _savers.FindIndex(x => x == userId);
            if (index == -1) return false;
            _savers.RemoveAt(index);
            return true;
        }

        public void IncreaseNumberOfComments() => ++NumberOfComments;
        public void DecreaseNumberOfComments() => --NumberOfComments;
        public void IncreaseNumberOfSolutions() => ++NumberOfSolutions;
        public void DecreaseNumberOfSolutions() => --NumberOfSolutions;
        public void IncreaseNumberOfIncorrectSolutions() => ++NumberOfCorrectSolutions;
        public void DecreaseNumberOfIncorrectSolutions() => --NumberOfCorrectSolutions;
    }
}
