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
        public QuestionExam Exam { get; private set; }
        public QuestionSubject Subject { get; private set; }
        public int NumberOfMedia { get; private set; }
        public IReadOnlyCollection<QuestionTopic> Topics { get; private set; }
       
        public Question(int userId, QuestionContent? content, QuestionExam exam, QuestionSubject subject, int numberOfMedia, IEnumerable<QuestionTopic> topics)
        {
            if (content == null && numberOfMedia <= 0 )
                throw new QuesitonContentRequiredException();
            if (numberOfMedia > MaxMediaPerQuestion)
                throw new TooManyQuestionMediasException();
            if (topics.Count() > MaxTopicsPerQuestion)
                throw new TooManyQuestionTopicsException();

            UserId = userId;
            Content = content;
            Exam = exam;
            Subject = subject;
            NumberOfMedia = numberOfMedia;
            Topics = [.. topics];
        }

        public void Create()
        {
            Id = Guid.NewGuid();
            CreatedAt = DateTime.UtcNow;
            Version = 0;
        }

        public void MarkExamAsValid()
        {
            Exam = Exam.MarkedAsValid();
            Version++;
        }
        public void MarkExamAsInvalid()
        {
            Exam = Exam.MarkedAsInvalid();
            Version++;
        }

        public void MarkSubjectAsValid()
        {
            Subject = Subject.MarkAsValid();
            Version++;
        }
        public void MarkSubjectAsNotBelong()
        {
            Exam = Exam.MarkedAsValid();
            Subject = Subject.MarkAsInvalid(QuestionSubjectInvalidReason.NotBelong);
            Version++;
        }
        public void MarkSubjectAsNotFound()
        {
            Subject = Subject.MarkAsInvalid(QuestionSubjectInvalidReason.NotFound);
            Version++;
        }

        public void SetContentNsfwScores(IEnumerable<NsfwScore> scores)
        {
            Content = Content?.SetNsfwScores(scores);
            Version++;
        }

        public void SetTopicsNsfwScores(IEnumerable<IEnumerable<NsfwScore>> Scores)
        {
            var topics = new List<QuestionTopic>();
            for (int i = 0; i < Scores.Count(); i++)
                topics.Add(Topics.ElementAt(i).SetNsfwScore(Scores.ElementAt(i)));
            Topics = topics;
            Version++;
        }
    }

}
