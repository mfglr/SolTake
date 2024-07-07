namespace MySocailApp.Domain.QuestionAggregate
{
    public interface ISubjectValidator
    {
        bool IsValid(Exam exam,Subject subject);
    }
}
