using MassTransit;

namespace SolTake.ThumbnailGenerator.Application.ApplicationServices.GenerateThumbnail
{
    internal class GenerateThumbnailHandler(IBlobService blobService, IThumbnailGenerator thumbnailGenerator, ITempDirectoryManager tempDirectoryManager) : IConsumer<GenerateThumbnailDto>
    {
        private readonly IBlobService _blobService = blobService;
        private readonly IThumbnailGenerator _thumbnailGenerator = thumbnailGenerator;
        private readonly ITempDirectoryManager _tempDirectoryManager = tempDirectoryManager;

        public async Task Consume(ConsumeContext<GenerateThumbnailDto> context)
        {
            try
            {
                await _tempDirectoryManager.Create(context.CancellationToken);

                var stream = await _blobService.GetAsync(context.Message.ContainerName,context.Message.BlobName,context.CancellationToken);
                var outputStream = await _thumbnailGenerator.GenerateAsync(stream, context.Message.Resulation,context.Message.IsSquare, context.CancellationToken);

                string blobName;
                if (context.Message.IsSquare)
                    blobName = $"{context.Message.BlobName}_square_{context.Message.Resulation}";
                else
                    blobName = $"{context.Message.BlobName}_{context.Message.Resulation}";

                await _blobService.UploadAsync(outputStream, context.Message.ContainerName, blobName, context.CancellationToken);

                stream.Close();
                stream.Dispose();

                outputStream.Close();
                outputStream.Dispose();

                await _tempDirectoryManager.Delete(context.CancellationToken);
            }
            catch (Exception)
            {
                await _tempDirectoryManager.Delete(context.CancellationToken);
                throw;
            }

        }
    }
}
