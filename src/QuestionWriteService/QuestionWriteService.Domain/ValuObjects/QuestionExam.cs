namespace QuestionWriteService.Domain.ValuObjects
{
    public class QuestionExam
    {
        public string Name { get; private set; }

        public QuestionExam(string name)
        {
            ArgumentNullException.ThrowIfNull(name);
            Name = name;
        }
    }
}
