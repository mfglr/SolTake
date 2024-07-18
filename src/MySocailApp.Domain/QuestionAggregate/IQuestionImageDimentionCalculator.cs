namespace MySocailApp.Domain.QuestionAggregate
{
    public interface IQuestionImageDimentionCalculator
    {
        QuestionImageDimention Calculate(Stream stream);
    }
}
