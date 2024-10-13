using MySocailApp.Core;

namespace MySocailApp.Domain.SolutionAggregate.Entities
{
    public class SolutionImage : Entity
    {
        public int SolutionId { get; private set; }
        public string BlobName { get; private set; } = null!;
        public float Height { get; private set; }
        public float Width { get; private set; }

        private SolutionImage() { }

        public static SolutionImage Create(string blobName, float height, float width)
            => new () {
                BlobName = blobName,
                Height = height,
                Width = width,
                CreatedAt = DateTime.UtcNow
            };
    }
}
