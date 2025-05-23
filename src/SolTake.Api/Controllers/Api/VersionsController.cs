using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using SolTake.Application.Commands.AppVersionAggregate.CreateVersion;
using SolTake.Application.Commands.AppVersionAggregate.DeleteLastVersion;
using SolTake.Application.Queries.AppVersionAggregate;
using SolTake.Application.Queries.AppVersionAggregate.GetLatestVersion;
using SolTake.Application.Queries.AppVersionAggregate.IsUpgradeRequired;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    
    public class VersionsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        public async Task Create(CreateVersionDto request,CancellationToken cancellationToken)
            => await _mediator.Send(request,cancellationToken);

        [HttpDelete]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        public async Task DeleteLastVersion(CancellationToken cancellationToken)
            => await _mediator.Send(new DeleteLastVersionDto(), cancellationToken);

        [HttpGet]
        public async Task<AppVersionResponseDto> GetLatestVersion(CancellationToken cancellationToken)
            => await _mediator.Send(new GetLatestVersionDto(), cancellationToken);

        [HttpGet("{code}")]
        public async Task<bool> IsUpgradeRequired(string code, CancellationToken cancellationToken)
            => await _mediator.Send(new IsUpgradeRequiredDto(code), cancellationToken);
    }
}
