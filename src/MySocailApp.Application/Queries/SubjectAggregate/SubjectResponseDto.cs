namespace MySocailApp.Application.Queries.SubjectAggregate
{
    public class SubjectResponseDto
    {
        public int Id { get; private set; }
        public int ExamId { get; private set; }
        public string Name { get; private set; }
        private SubjectResponseDto() { }
    }
}
