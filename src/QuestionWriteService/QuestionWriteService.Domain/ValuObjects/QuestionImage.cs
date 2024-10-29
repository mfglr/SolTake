namespace QuestionWriteService.Domain.ValuObjects
{
    public class QuestionImage
    {
        public string BlobName { get; private set; }
        public float Height { get; private set; }
        public float Width { get; private set; }

        public QuestionImage(string blobName, float height, float width)
        {
            ArgumentNullException.ThrowIfNull(blobName);
            ArgumentNullException.ThrowIfNull(height);
            ArgumentNullException.ThrowIfNull(width);

            BlobName = blobName;
            Height = height;
            Width = width;
        }
    }
}
