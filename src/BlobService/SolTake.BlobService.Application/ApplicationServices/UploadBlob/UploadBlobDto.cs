using Microsoft.AspNetCore.Http;

namespace SolTake.BlobService.Application.ApplicationServices.UploadBlob
{
    public record UploadBlobDto(string ContainerName, IFormFileCollection Media);
}
