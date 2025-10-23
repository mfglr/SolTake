using MassTransit;

namespace SolTake.BlobService.Application.ApplicationServices.UploadBlob
{
    internal class UploadBlobHandler(IBlobService blobService) : IConsumer<UploadBlobDto>
    {
        private readonly IBlobService _blobService = blobService;
        public async Task Consume(ConsumeContext<UploadBlobDto> context)
        {
            var blobNames = await _blobService.UploadAsync(context.Message.ContainerName, context.Message.Media, context.CancellationToken);
            try
            {
                await context.RespondAsync(new UploadBlobResponseDto(blobNames));
            }
            catch (Exception)
            {
                await _blobService.DeleteAsync(context.Message.ContainerName, blobNames, CancellationToken.None);
                throw;
            }
        }
    }
}
