﻿using MassTransit.Mediator;
using Microsoft.AspNetCore.Mvc;
using SolTake.BlobService.Application.ApplicationServices.DeleteBlob;
using SolTake.BlobService.Application.ApplicationServices.GetBlob;
using SolTake.BlobService.Application.ApplicationServices.UploadBlob;
using SolTake.BlobService.Application.ApplicationServices.UploadSingleBlob;

namespace SolTake.BlobService.Api.Controllers
{
    [Route("api/v1/[controller]/[action]")]
    [ApiController]
    public class BlobsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [RequestSizeLimit(104857600)]
        [HttpPost]
        public async Task<IEnumerable<string>> Upload([FromForm]string containerName, [FromForm]IFormFileCollection media, CancellationToken cancellationToken)
        {
            var client = _mediator.CreateRequestClient<UploadBlobDto>();
            var response = await client.GetResponse<UploadBlobResponseDto>(new UploadBlobDto(containerName, media),cancellationToken: cancellationToken);
            return response.Message.BlobNames;
        }

        [RequestSizeLimit(104857600)]
        [HttpPost]
        public async Task UploadSingleBlob([FromForm] string containerName, [FromForm] string blobName, [FromForm] IFormFile media, CancellationToken cancellationToken) =>
            await _mediator.Send(new UploadSingleBlobDto(containerName, blobName, media), cancellationToken);

        [HttpPost]
        public async Task Delete(DeleteBlobDto request, CancellationToken cancellationToken)
             => await _mediator.Send(request,cancellationToken);

        [HttpGet("{containerName}/{blobName}")]
        public async Task<Stream> Get(string containerName, string blobName, CancellationToken cancellationToken)
        {
            var client = _mediator.CreateRequestClient<GetBlobDto>();
            var response = await client.GetResponse<GetBlobResponseDto>(new GetBlobDto(containerName,blobName), cancellationToken: cancellationToken);
            return response.Message.Stream;
        }
    }
}
