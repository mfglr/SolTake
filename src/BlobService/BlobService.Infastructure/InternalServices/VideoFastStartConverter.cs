using BlobService.Application;
using BlobService.Application.Objects;
using Xabe.FFmpeg;

namespace BlobService.Infastructure.InternalServices
{
    public static class VideoFastStartConverter
    {
        public static async Task<string> Convert(ITransactionService transactionService, Stream stream, string containerName, CancellationToken cancellationToken)
        {
            //save video to temp directory;
            var tempBlobName = BlobNameGenerator.Generate(RootName.Temp, ContainerName.Temp);
            var tempPath = PathFinder.GetPath(RootName.Temp, ContainerName.Temp, tempBlobName);
            using var tempFile = File.Create(tempPath);
            await stream.CopyToAsync(tempFile, cancellationToken);
            tempFile.Close();

            //convert video to fast start
            var outputBlobName = BlobNameGenerator.Generate(RootName.Video, containerName, "mp4");
            var output = PathFinder.GetPath(RootName.Video, containerName, outputBlobName);
            FFmpeg.SetExecutablesPath("FFmpeg");
            var conversation = FFmpeg.Conversions.New().AddParameter($"-i \"{tempPath}\" -c:v libx264 -c:a aac -movflags +faststart \"{output}\"");
            await conversation.Start(cancellationToken);
            transactionService.AddFileCreated(output);

            //Delete temp file
            File.Delete(tempPath);

            return outputBlobName;
        }
    }
}
