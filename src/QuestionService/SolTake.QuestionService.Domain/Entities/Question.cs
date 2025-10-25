using SolTake.Core;
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
        public QuestionExamName ExamName { get; private set; }
        public QuestionSubjectName SubjectName { get; private set; }
        public IReadOnlyCollection<QuestionTopic> Topics { get; private set; }
        public IReadOnlyCollection<Media> Media { get; private set; }
        public IReadOnlyCollection<UnpublishedReason> UnpublishedReasons { get; private set; }

        private Question() { }
       
        public Question(int userId, QuestionContent? content, QuestionExamName examName, QuestionSubjectName subjectName, IEnumerable<QuestionTopic> topics, IEnumerable<Media> media)
        {
            if (content == null && !media.Any())
                throw new QuesitonContentRequiredException();

            if (media.Count() > MaxMediaPerQuestion)
                throw new TooManyQuestionMediasException();

            if (topics.Count() > MaxTopicsPerQuestion)
                throw new TooManyQuestionTopicsException();

            UserId = userId;
            Content = content;
            ExamName = examName;
            SubjectName = subjectName;
            Topics = [.. topics];
            Media = [.. media];
            UnpublishedReasons = [];
        }

        public void Create()
        {
            Id = Guid.NewGuid();
            CreatedAt = DateTime.UtcNow;
            Version = 0;
        }
        
        public void SetNsfwScores(
            IEnumerable<NsfwScore>? contentScore,
            IEnumerable<IEnumerable<NsfwScore>> topicScores,
            IEnumerable<IEnumerable<NsfwScore>> mediaScores
        )
        {
            if(Content != null)
                Content = Content.SetNsfwScores(contentScore!);

            List<QuestionTopic> topics = [];
            for(int i = 0; i < topicScores.Count(); i++)
                topics.Add(Topics.ElementAt(i).SetNsfwScore(topicScores.ElementAt(i)));
            Topics = topics;

            List<Media> media = [];
            for(int i = 0;i < mediaScores.Count(); i++)
                media.Add(Media.ElementAt(i).SetNsfw(mediaScores.ElementAt(i)));
            Media = media;

            Version++;
        }

        public void SetMediaDimentions(IEnumerable<Dimention> dimentions)
        {
            List<Media> media = [];
            for (int i = 0; i < dimentions.Count(); i++)
                media.Add(Media.ElementAt(i).SetAspectRatio(dimentions.ElementAt(i)));
            Media = media;

            Version++;
        }

        public void SetMediaNsfwScore(string blobName, IEnumerable<NsfwScore> score)
        {
            if (!Media.Any(m => m.BlobName == blobName))
                throw new MediaNotFoundException();
            Media = [.. Media.Select(media => media.BlobName == blobName ? media.SetNsfw(score) : media)];
            Version++;
        }

        public void MarkAsDraft()
        {
            if (UnpublishedReasons.Any(x => x == UnpublishedReason.MarkedAsDraft))
                throw new QuestionIsAlreadyDraftException();

            UnpublishedReasons = [.. UnpublishedReasons, UnpublishedReason.MarkedAsDraft];
            Version++;
        }

        public void Publish()
        {
            if (!UnpublishedReasons.Any(x => x == UnpublishedReason.MarkedAsDraft))
                throw new QuestionIsNotDraftException();
            UnpublishedReasons = [.. UnpublishedReasons.Where(x => x != UnpublishedReason.MarkedAsDraft)];
            Version++;
        }

        public void RemoveUnpublishedReason(UnpublishedReason reason)
        {
            UnpublishedReasons = [.. UnpublishedReasons.Where(x => x != reason)];
            Version++;
        }

        public void Unpublish(UnpublishedReason reason)
        {
            UnpublishedReasons = [.. UnpublishedReasons, reason];
            Version++;
        }
    }

}
