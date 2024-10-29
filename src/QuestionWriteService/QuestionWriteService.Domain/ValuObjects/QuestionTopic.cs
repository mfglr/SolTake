namespace QuestionWriteService.Domain.ValuObjects
{
    public class QuestionTopic
    {
        public string Name { get; private set; }

        public QuestionTopic(string name)
        {
            ArgumentNullException.ThrowIfNull(name);
            Name = name;
        }
    }
}
