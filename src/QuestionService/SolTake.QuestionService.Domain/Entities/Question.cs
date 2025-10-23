using SolTake.Core.Media;
using SolTake.QuestionService.Domain.Exceptions;
using SolTake.QuestionService.Domain.ValueObjects;

namespace SolTake.QuestionService.Domain.Entities
{
    public class Question
    {
        public readonly static int MaxMediaPerQuestion = 5;
        public readonly static int MaxTopicsPerQuestion = 3;

        public Guid Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int Version { get; private set; }
        public int UserId { get; private set; }
        public QuestionContent? Content { get; private set; }
        public int ExamId { get; private set; }
        public int SubjectId { get; private set; }
        public IReadOnlyCollection<QuestionTopic> Topics { get; private set; }
        public IReadOnlyCollection<Media> Media { get; private set; }

        private Question() { }

       
        public Question(int userId, QuestionContent? content, int examId, int subjectId, IEnumerable<QuestionTopic> topics, IEnumerable<Media> media)
        {
            if (content == null || !media.Any())
                throw new QuesitonContentRequiredException();

            if (media.Count() > MaxMediaPerQuestion)
                throw new TooManyQuestionMediasException();

            if (topics.Count() > MaxTopicsPerQuestion)
                throw new TooManyQuestionTopicsException();

            UserId = userId;
            Content = content;
            ExamId = examId;
            SubjectId = subjectId;
            Topics = [.. topics];
            Media = [.. media];
        }

        public void Create()
        {
            Id = Guid.NewGuid();
            CreatedAt = DateTime.UtcNow;
            Version = 0;
        }

        public void UpdateContent(QuestionContent content)
        {
            Content = content;
            Version++;
        }
        
        public void SetMediaNsfwScore(string blobName, IEnumerable<NsfwScore> score)
        {
            if (!Media.Any(m => m.BlobName == blobName))
                throw new MediaNotFoundException();
            Media = [.. Media.Select(media => media.BlobName == blobName ? media.SetNsfw(score) : media)];
            Version++;
        }
    }
}
