namespace SolTake.Core.Media
{
    public class Media
    {
        public string ContainerName { get; private set; }
        public string BlobName { get; private set; }
        public double AspectRatio { get; private set; }
        public MediaType Type { get; private set; }
        public IEnumerable<NsfwScore> Scores { get; private set; }

        private Media(string containerName, string blobName, double aspectRatio, MediaType type, IEnumerable<NsfwScore> scores)
        {
            ContainerName = containerName;
            BlobName = blobName;
            AspectRatio = aspectRatio;
            Type = type;
            Scores = scores;
        }

        public Media(string containerName, string blobName, MediaType type)
        {
            ContainerName = containerName;
            BlobName = blobName;
            Type = type;
            Scores = [];
        }

        public Media SetNsfw(IEnumerable<NsfwScore> scores) =>
            new(ContainerName,BlobName,AspectRatio,Type, scores);

        public Media SetAspectRatio(double aspectRatio) =>
           new(ContainerName, BlobName, aspectRatio, Type, Scores);
    }
}
