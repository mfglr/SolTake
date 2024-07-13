using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Domain.TopicAggregate
{
    public class Topic()
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public string Name { get; private set; }
        public TopicExam Exam { get; private set; }
        public TopicSubject Subject { get; private set; }
        
        public void Create(string name,TopicExam exam,TopicSubject subject)
        {
            Name = name;
            Exam = exam;
            Subject = subject;
            CreatedAt = DateTime.UtcNow;
        }
        public IReadOnlyCollection<QuestionTopic> Questions { get; }
    }
}
