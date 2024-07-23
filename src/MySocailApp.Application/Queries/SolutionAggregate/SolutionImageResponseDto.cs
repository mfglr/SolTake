namespace MySocailApp.Application.Queries.SolutionAggregate
{
    public class SolutionImageResponseDto
    {
        public int Id { get; private set; }
        public int SolutionId { get; private set; }
        public string BlobName { get; private set; }
        public float Height { get; private set; }
        public float Width { get; private set; }
        private SolutionImageResponseDto(){}
    }
}
