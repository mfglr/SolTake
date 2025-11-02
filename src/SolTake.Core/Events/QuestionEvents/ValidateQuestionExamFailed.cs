namespace SolTake.Core.Events.QuestionEvents
{

    public enum Reason_ValidateExamFailed { ExamNotFound, SubjectNotBelong }
    public record ValidateQuestionExamFailed(Guid Id, Reason_ValidateExamFailed Reason);
}
