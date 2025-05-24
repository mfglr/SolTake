using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.NotificationDomain.NotificationAggregate.MarkAsViewedNotifications;
using SolTake.Application.Queries.NotificationAggregate;
using SolTake.Application.Queries.NotificationAggregate.GetUnviewedNotifications;
using SolTake.Application.Queries.NotificationAggregate.GetViewedNotifications;

namespace SolTake.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class NotificationsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpGet]
        public async Task<List<NotificationResponseDto>> GetUnviewedNotifications(CancellationToken cancellationToken)
            => await _mediator.Send(new GetUnviewedNotificationsDto(), cancellationToken);

        [HttpGet]
        public async Task<List<NotificationResponseDto>> GetNotifications([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetViewedNotificationsDto(offset, take, isDescending), cancellationToken);

        [HttpPut]
        public async Task MarkAsViewed(MarkAsViewedNotificationsDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);
    }
}
