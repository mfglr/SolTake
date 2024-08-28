namespace MySocailApp.Application.Queries.ExamAggregate
{
    public class ExamResponseDto
    {
        public int Id { get; private set; }
        public string ShortName { get; private set; } = null!;
        public string FullName { get; private set; } = null!;
        private ExamResponseDto() { }
    }
}
