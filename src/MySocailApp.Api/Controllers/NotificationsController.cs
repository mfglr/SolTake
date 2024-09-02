using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.NotificationAggregate.MarkAsViewedNotifications;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Application.Queries.NotificationAggregate.GetUnviewedNotifications;
using MySocailApp.Application.Queries.NotificationAggregate.GetViewedNotifications;

namespace MySocailApp.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailConfirmationFilterAttribute))]
    public class NotificationsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpGet]
        public async Task<List<NotificationResponseDto>> GetUnviewedNotifications(CancellationToken cancellationToken)
            => await _mediator.Send(new GetUnviewedNotificationsDto(), cancellationToken);

        [HttpGet]
        public async Task<List<NotificationResponseDto>> GetNotifications([FromQuery]int? offset, [FromQuery]int take, [FromQuery]bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetViewedNotificationsDto(offset, take, isDescending), cancellationToken);

        [HttpPut]
        public async Task MarkAsViewed(MarkAsViewedNotificationsDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);
    }
}
