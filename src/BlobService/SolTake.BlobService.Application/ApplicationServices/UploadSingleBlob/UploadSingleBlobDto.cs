using Microsoft.AspNetCore.Http;

namespace SolTake.BlobService.Application.ApplicationServices.UploadSingleBlob
{
    public record UploadSingleBlobDto(string ContainerName, string BlobName, IFormFile Media);
}
