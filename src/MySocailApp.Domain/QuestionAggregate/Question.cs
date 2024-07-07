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
        public Exam Exam { get; private set; }
        public Subject Subject { get; private set; }

        private readonly List<QuestionImage> _images = [];
        public IReadOnlyCollection<QuestionImage> Images => _images;
        public bool HasBlobName(string blobName) => _images.Any(x => x.BlobName == blobName);

        internal void Create(int appUserId,string? content,Exam exam,Subject subject,IEnumerable<int>? topicIds,IEnumerable<QuestionImage> images)
        {
            ArgumentNullException.ThrowIfNull(appUserId);

            AppUserId = appUserId;
            Content = content;
            Exam = exam;
            Subject = subject;
            CreatedAt = DateTime.UtcNow;

            foreach (var image in images)
                _images.Add(image);
            
            if (topicIds != null)
                foreach (var topicId in topicIds)
                    _questionTopics.Add(QuestionTopic.Create(Id, topicId));
        }

        private readonly List<QuestionTopic> _questionTopics = [];
        public IReadOnlyCollection<QuestionTopic> QuestionTopics => _questionTopics;
        public void AddTopic(int topicId) => _questionTopics.Add(QuestionTopic.Create(Id, topicId));
    }
}
