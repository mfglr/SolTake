namespace MySocailApp.Domain.QuestionAggregate
{
    public interface ISubjectValidator
    {
        bool IsValid(QuestionExam exam,QuestionSubject subject);
    }
}
