namespace QuestionWriteService.Domain.Exceptions
{
    public class QuestionImageRequiredException : Exception
    {
        private readonly static string _message = "You must upload at least an image!";
        public QuestionImageRequiredException() : base(_message){}
    }
}
