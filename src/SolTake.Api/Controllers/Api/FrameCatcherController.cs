using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Queries.CatchFrame;

namespace MySocailApp.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class FrameCatcherController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpGet("{containerName}/{blobName}/{position}")]
        public async Task<FileResult> CatchFrame([FromRoute] string containerName, [FromRoute] string blobName, [FromRoute] double position, CancellationToken cancellationToken)
            => File(
                await _mediator.Send(new CatchFrameDto(containerName, blobName, position), cancellationToken),
                "image/webp"
               );
    }
}
