﻿using Newtonsoft.Json;

namespace SolTake.Core
{
    public class Multimedia
    {
        public string ContainerName { get; private set; }
        public string BlobName { get; private set; }
        public string? BlobNameOfFrame { get; private set; }
        public long Size { get; private set; }
        public double Height { get; private set; }
        public double Width { get; private set; }
        public double Duration { get; private set; }
        public MultimediaType MultimediaType { get; private set; }

        [JsonConstructor]
        private Multimedia(string containerName, string blobName, string? blobNameOfFrame, long size, double height, double width, double duration, MultimediaType multimediaType)
        {
            ContainerName = containerName;
            BlobName = blobName;
            BlobNameOfFrame = blobNameOfFrame;
            Size = size;
            Height = height;
            Width = width;
            Duration = duration;
            MultimediaType = multimediaType;
        }

        private Multimedia(string containerName, string blobName, long size, double height, double width)
        {
            ContainerName = containerName;
            BlobName = blobName;
            Size = size;
            Height = height;
            Width = width;
            Duration = 0;
        }

        private Multimedia(string containerName, string blobName, string blobNameOfFrame, long size, double height, double width, double duration)
        {
            ContainerName = containerName;
            BlobName = blobName;
            BlobNameOfFrame = blobNameOfFrame;
            Size = size;
            Height = height;
            Width = width;
            Duration = duration;
        }

        public static Multimedia CreateImage(string containerName, string blobName, long size, double height, double width)
            => new(containerName, blobName, size, height, width) { MultimediaType = MultimediaType.Image };

        public static Multimedia CreateVideo(string containerName, string blobName, string blobNameOfFrame, long size, double height, double width, double duration)
            => new(containerName, blobName, blobNameOfFrame, size, height, width, duration) { MultimediaType = MultimediaType.Video };


        public static Multimedia Clone(Multimedia media) => new(
            media.ContainerName,
            media.BlobName,
            media.BlobNameOfFrame,
            media.Size,
            media.Height,
            media.Width,
            media.Duration,
            media.MultimediaType
        );

    }
}
