namespace QuestionWriteService.Domain.Exceptions
{
    public class NoQuestionSaveException : Exception
    {
        private readonly static string _message = "You didn't save the question!";
        public NoQuestionSaveException() : base(_message) { }
    }
}
