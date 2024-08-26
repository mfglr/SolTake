using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Commands.NotificationConnectionAggregate.ConnectNotificationHub;
using MySocailApp.Application.Commands.NotificationConnectionAggregate.DisconnectNotificationHub;

namespace MySocailApp.Application.Hubs
{
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class NotificationHub(IMediator mediator) : Hub
    {
        private readonly IMediator _mediator = mediator;

        public override async Task OnConnectedAsync()
            => await _mediator.Send(new ConnectNotificationHubDto(Context.ConnectionId));

        public override async Task OnDisconnectedAsync(Exception? exception)
            => await _mediator.Send(new DisconnectNotificationHubDto());
    }
}
