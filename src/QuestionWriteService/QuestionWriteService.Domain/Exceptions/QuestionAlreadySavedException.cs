namespace QuestionWriteService.Domain.Exceptions
{
    public class QuestionAlreadySavedException : Exception
    {
        private readonly static string _message = "You have already saved the question!";
        public QuestionAlreadySavedException() : base(_message) { }
    }
}
