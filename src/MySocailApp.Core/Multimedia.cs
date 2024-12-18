namespace MySocailApp.Core
{
    public class Multimedia
    {
        public string BlobName { get; private set; }
        public long Size { get; private set; }
        public double Height { get; private set; }
        public double Width { get; private set; }
        public double Duration { get; private set; }
        public MediaType MediaType { get; private set; }

        private Multimedia(string blobName, long size, double height, double width)
        {
            BlobName = blobName;
            Size = size;
            Height = height;
            Width = width;
            Duration = 0;
        }

        private Multimedia(string blobName, long size, double height, double width, double duration)
        {
            BlobName = blobName;
            Size = size;
            Height = height;
            Width = width;
            Duration = duration;
        }

        private Multimedia(string blobName, long size, double duration)
        {
            BlobName = blobName;
            Size = size;
            Height = 0;
            Width = 0;
            Duration = duration;
        }

        public static Multimedia CreateImage(string blobName, long size, double height, double width)
            => new(blobName, size, height, width) { MediaType = MediaType.Image};

        public static Multimedia CreateVideo(string blobName, long size, double height, double width, double duration)
            => new(blobName, size, height, width, duration) { MediaType = MediaType.Video };

        public static Multimedia CreateAudio(string blobName, long size, double duration)
            => new(blobName, size, duration) { MediaType = MediaType.Audio };
    }
}
