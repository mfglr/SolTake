namespace MySocailApp.Core
{
    public class MultiMedya
    {
        public string BlobName { get; private set; }
        public long Size { get; private set; }
        public double Height { get; private set; }
        public double Width { get; private set; }
        public double Duration { get; private set; }
        public MedyaType MedyaType { get; private set; }

        private MultiMedya(string blobName, long size, double height, double width)
        {
            BlobName = blobName;
            Size = size;
            Height = height;
            Width = width;
            Duration = 0;
        }

        private MultiMedya(string blobName, long size, double height, double width, double duration)
        {
            BlobName = blobName;
            Size = size;
            Height = height;
            Width = width;
            Duration = duration;
        }

        private MultiMedya(string blobName, long size, double duration)
        {
            BlobName = blobName;
            Size = size;
            Height = 0;
            Width = 0;
            Duration = duration;
        }

        public static MultiMedya CreateImage(string blobName, long size, double height, double width)
            => new(blobName, size, height, width) { MedyaType = MedyaType.Image};

        public static MultiMedya CreateVideo(string blobName, long size, double height, double width, double duration)
            => new(blobName, size, height, width, duration) { MedyaType = MedyaType.Video };

        public static MultiMedya CreateAudio(string blobName, long size, double duration)
            => new(blobName, size, duration) { MedyaType = MedyaType.Audio };
    }
}
