using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Domain.PostAggregate
{
    public class Question
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? Updatedat { get; private set; }

        public int AppUserId { get; private set; }
        public AppUser AppUser { get; }

        public string? Content { get; private set; }
        public QuestionExam Exam { get; private set; }
        public QuestionSubject Subject { get; private set; }

        private readonly List<QuestionImage> _images = [];
        public IReadOnlyCollection<QuestionImage> Images => _images;
        public bool HasBlobName(string blobName) => _images.Any(x => x.BlobName == blobName);
        internal void AddImages(IEnumerable<string> blobNames) => _images.AddRange(blobNames.Select(QuestionImage.Create));

        private readonly List<QuestionTopic> _questionTopics = [];
        public IReadOnlyCollection<QuestionTopic> QuestionTopics => _questionTopics;
        internal void AddNewTopics(IEnumerable<int> topicsId)
        {
            _questionTopics.Clear();
            _questionTopics.AddRange(topicsId.Select(topicId => QuestionTopic.Create(Id, topicId)));
        }

        internal void Create(int appUserId, string? content, QuestionExam exam, QuestionSubject subject)
        {
            ArgumentNullException.ThrowIfNull(appUserId);
            AppUserId = appUserId;
            Content = content;
            Exam = exam;
            Subject = subject;
            CreatedAt = DateTime.UtcNow;
        }
    }
}
