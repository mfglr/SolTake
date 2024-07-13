using MySocailApp.Domain.ExamAggregate;

namespace MySocailApp.Domain.QuestionAggregate
{
    public interface IExamRepository
    {
        Task<Exam?> GetAsync(int id,int subjectId,IEnumerable<int> topicIds,CancellationToken cancellationToken); 
    }
}
