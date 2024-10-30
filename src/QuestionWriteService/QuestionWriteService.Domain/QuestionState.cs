using QuestionWriteService.Domain.Exceptions;
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
        public int NumberOfLikes { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }

        private readonly List<QuestionTopic> _topics = [];
        private readonly List<QuestionImage> _images = [];

        public QuestionState(UserId userId, QuestionExam exam, QuestionSubject subject, IEnumerable<QuestionTopic>? topics, QuestionContent content, IEnumerable<QuestionImage> images)
        {

            if (!images.Any())
                throw new QuestionImageRequiredException();
            if (images.Count() > MaxImageCountPerQuestion)
                throw new QuestionImagesCountExceededException();

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

        private readonly List<UserId> _likers = [];
        public void Like(UserId userId)
        {
            if (Likers.Any(x => x == userId))
                throw new QuestionAlreadyLikedException();
            _likers.Add(userId);
            NumberOfLikes++;
        }
        public void Dislike(UserId userId)
        {
            var index = _likers.FindIndex(x => x == userId);
            if (index == -1)
                throw new NoQuestionLikeException();
            _likers.RemoveAt(index);
            NumberOfLikes--;
        }
        
        private readonly List<UserId> _savers = [];
        public void Save(UserId userId)
        {
            if (Savers.Any(x => x == userId))
                throw new QuestionAlreadySavedException();
            _savers.Add(userId);
        }
        public void Unsave(UserId userId) {
            var index = _savers.FindIndex(x => x == userId);
            if (index == -1)
                throw new NoQuestionSaveException();
            _savers.RemoveAt(index);
        }

        public void CreateComment() => ++NumberOfComments;
        public void DeleteComment() => --NumberOfComments;

        public void CreateSolution() => ++NumberOfSolutions;
        public void DeleteNotCorrectSolution() => --NumberOfSolutions;
        public void DeleteCorrectSolution()
        {
            --NumberOfSolutions;
            --NumberOfCorrectSolutions;
        }
    }
}
