namespace QuestionWriteService.Domain.ValuObjects
{
    public class QuestionSubject
    {
        public string Name { get; private set; }

        public QuestionSubject(string name)
        {
            ArgumentNullException.ThrowIfNull(name);
            Name = name;
        }
    }
}
