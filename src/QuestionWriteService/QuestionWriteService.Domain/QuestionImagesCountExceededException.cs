namespace QuestionWriteService.Domain
{
    public class QuestionImagesCountExceededException : Exception
    {
        private readonly static string _message = $"You can upload up to {QuestionState.MaxImageCountPerQuestion} images per question!";
        public QuestionImagesCountExceededException() : base(_message) { }
    }
}
