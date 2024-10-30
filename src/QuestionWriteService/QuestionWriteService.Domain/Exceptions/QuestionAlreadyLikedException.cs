namespace QuestionWriteService.Domain.Exceptions
{
    public class QuestionAlreadyLikedException : Exception
    {
        private readonly static string _message = "You have already liked the question!";
        public QuestionAlreadyLikedException() : base(_message) { }
    }
}
