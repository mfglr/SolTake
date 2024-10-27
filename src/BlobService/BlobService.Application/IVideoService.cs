﻿using BlobService.Application.Objects;
using Microsoft.AspNetCore.Http;

namespace BlobService.Application
{
    public interface IVideoService
    {
        Task<AppVideo> SaveAsync(IFormFile file, string containerNameOfVideo, string containerNameOfFrame, CancellationToken cancellationToken);
        void Delete(string containerName, string blobName);
        Task<byte[]> Read(string containerName, string blobName, int offset, int count, CancellationToken cancellationToken);
        Stream Read(string containerName, string blobName);
    }
}
