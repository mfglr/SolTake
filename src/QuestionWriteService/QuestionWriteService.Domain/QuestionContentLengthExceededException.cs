using QuestionWriteService.Domain.ValuObjects;

namespace QuestionWriteService.Domain
{
    public class QuestionContentLengthExceededException : Exception
    {
        private readonly static string _message = $"The content length exceeds the allowed maximum limit of {QuestionContent.MaxQuestionContentLength} characters.";

        public QuestionContentLengthExceededException() : base(_message) { }
    }
}
