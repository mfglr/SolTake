using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.ExamAggregate;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate;

namespace MySocailApp.Domain.QuestionAggregate
{
    public class Question()
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? Updatedat { get; private set; }
        public int ExamId { get; private set; }
        public int SubjectId { get; private set; }
        public int AppUserId { get; private set; }
        public string? Content { get; private set; }

        private readonly List<QuestionImage> _images = [];
        public IReadOnlyCollection<QuestionImage> Images => _images;
        public bool HasBlobName(string blobName) => _images.Any(x => x.BlobName == blobName);
        internal void AddImage(string blobName,QuestionImageDimention dimention) => _images.Add(QuestionImage.Create(blobName, dimention));

        private readonly List<QuestionTopic> _topics = [];
        public IReadOnlyCollection<QuestionTopic> Topics => _topics;
        internal void AddNewTopics(IEnumerable<int> topicIds)
        {
            _topics.Clear();
            _topics.AddRange(topicIds.Select(topicId => QuestionTopic.Create(Id, topicId)));
        }

        internal void Create(int appUserId, string? content, int examId, int subjectId)
        {
            AppUserId = appUserId;
            Content = content;
            ExamId = examId;
            SubjectId = subjectId;
            CreatedAt = DateTime.UtcNow;
        }

        private readonly List<QuestionUserLike> _likes = [];
        public IReadOnlyList<QuestionUserLike> Likes => _likes;
        public void Like(int userId)
        {
            var index = _likes.FindIndex(x => x.AppUserId == userId);
            if (index != -1)
                _likes.RemoveAt(index);
            _likes.Add(QuestionUserLike.Create(Id, userId));
        }
        public void Dislike(int userId) {
            var index = _likes.FindIndex(x => x.AppUserId == userId);
            if(index != -1)
                _likes.RemoveAt(index);
        }

        public Exam Exam { get; }
        public Subject Subject { get; }
        public AppUser AppUser { get; }
        public IReadOnlyList<Solution> Solutions { get; }
    }
}
