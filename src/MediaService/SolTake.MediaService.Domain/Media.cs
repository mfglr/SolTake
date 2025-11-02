using SolTake.Core;
using SolTake.Core.Media;

namespace SolTake.MediaService.Domain
{
    public class Media(MediaType type, Guid ownerId, string containerName, string blobName) : IAggregateRoot
    {
        public Guid Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int Version { get; private set; }
        public MediaType Type { get; private set; } = type;
        public Guid OwnerId { get; private set; } = ownerId;
        public string ContainerName { get; private set; } = containerName;
        public string BlobName { get; private set; } = blobName;
        public string? TranscodedBlobName { get; set; }
        public Dimention? Dimention { get; private set; }
        public IReadOnlyCollection<Thumbnail> Thumbnails { get; private set; } = [];
        public IReadOnlyCollection<NsfwScore> NsfwScores { get; private set; } = [];

        public void Create()
        {
            Id = Guid.NewGuid();
            CreatedAt = DateTime.UtcNow;
            Version = 0;
        }

        public void SetTranscodedBlobName(string transcodedBlobName)
        {
            TranscodedBlobName = transcodedBlobName;
            Version++;
        }

        public void SetDimention(Dimention dimention)
        {
            Dimention = dimention;
            Version++;
        }

        public void AddThumbnail(Thumbnail thumbnail)
        {
            Thumbnails = [.. Thumbnails, thumbnail];
            Version++;
        }

        public void SetNsfwScores(IEnumerable<NsfwScore> scores)
        {
            NsfwScores = [.. scores];
            Version++;
        }
    }
}
