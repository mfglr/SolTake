using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.InfrastructureServices.BlobService;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    public class BlobsController(IBlobService blobService) : ControllerBase
    {
        private readonly IBlobService _blobService = blobService;

        [HttpGet("{containerName}/{blobName}")]
        public async Task<Stream> GetBlob(string containerName, string blobName,CancellationToken cancellationToken)
            => await _blobService.ReadAsync(containerName, blobName, cancellationToken);
    }
}
