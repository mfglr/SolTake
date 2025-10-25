namespace SolTake.Core.Media
{
    public class Media
    {
        public string ContainerName { get; private set; }
        public string BlobName { get; private set; }
        public Dimention? Dimention { get; private set; }
        public MediaType Type { get; private set; }
        public IEnumerable<NsfwScore> Scores { get; private set; }

        private Media(string containerName, string blobName, Dimention? dimention, MediaType type, IEnumerable<NsfwScore> scores)
        {
            ContainerName = containerName;
            BlobName = blobName;
            Dimention = dimention;
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
            new(ContainerName, BlobName, Dimention, Type, scores);

        public Media SetAspectRatio(Dimention dimention) =>
           new(ContainerName, BlobName, dimention, Type, Scores);
    }
}
