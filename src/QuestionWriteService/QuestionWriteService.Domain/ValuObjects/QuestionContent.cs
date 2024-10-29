namespace QuestionWriteService.Domain.ValuObjects
{
    public class QuestionContent
    {
        public readonly static int MaxQuestionContentLength = 500;
        public string Value { get; private set; }

        public QuestionContent(string value)
        {
            ArgumentNullException.ThrowIfNull(value);
            if (value.Length >= MaxQuestionContentLength)
                throw new QuestionContentLengthExceededException();
            Value = value;
        }
    }
}
