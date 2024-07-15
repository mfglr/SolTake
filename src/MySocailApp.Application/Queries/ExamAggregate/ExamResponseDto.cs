namespace MySocailApp.Application.Queries.ExamAggregate
{
    public class ExamResponseDto
    {
        public int Id { get; private set; }
        public string ShortName { get; private set; }
        public string FullName { get; private set; }
        private ExamResponseDto() { }
    }
}
