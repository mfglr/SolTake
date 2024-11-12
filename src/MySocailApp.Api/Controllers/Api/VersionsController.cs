using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.VersionAggregate.CreateVersion;
using MySocailApp.Application.Commands.VersionAggregate.DeleteLastVersion;
using MySocailApp.Application.Queries.VersionAggregate;
using MySocailApp.Application.Queries.VersionAggregate.GetLatestVersion;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    public class VersionsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task Create(CreateVersionDto request,CancellationToken cancellationToken)
            => await _mediator.Send(request,cancellationToken);

        [HttpDelete]
        public async Task DeleteLastVersion(CancellationToken cancellationToken)
            => await _mediator.Send(new DeleteLastVersionDto(), cancellationToken);

        [HttpGet]
        public async Task<VersionResponseDto> GetLatestVersion(CancellationToken cancellationToken)
            => await _mediator.Send(new GetLatestVersionDto(), cancellationToken);
    }
}
