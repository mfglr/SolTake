﻿using Microsoft.AspNetCore.Mvc;
using SolTake.Application.InfrastructureServices.BlobService;

namespace SolTake.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]")]
    public class BlobsController(IBlobService blobService) : ControllerBase
    {
        private readonly IBlobService _blobService = blobService;

        [HttpGet("{containerName}/{blobName}")]
        public async Task<Stream> GetBlob(string containerName, string blobName,CancellationToken cancellationToken)
            => await _blobService.ReadAsync(containerName, blobName, cancellationToken);
    }
}
