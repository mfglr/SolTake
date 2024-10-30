namespace QuestionWriteService.Domain.Exceptions
{
    public class NoQuestionLikeException : Exception
    {
        private readonly static string _message = "You already didn't like this question.";
        public NoQuestionLikeException() : base(_message) { }
    }
}
