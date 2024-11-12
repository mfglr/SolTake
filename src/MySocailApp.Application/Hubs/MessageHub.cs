using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Commands.MessageAggregate.AddReceiverToMessage;
using MySocailApp.Application.Commands.MessageAggregate.AddViewerToMessage;
using MySocailApp.Application.Commands.MessageAggregate.CreateMessage;
using MySocailApp.Application.Commands.MessageAggregate.MarkMessagesAsReceived;
using MySocailApp.Application.Commands.MessageAggregate.MarkMessagesAsViewed;
using MySocailApp.Application.Commands.UserConectionAggregate.ConnectMessageHub;
using MySocailApp.Application.Commands.UserConectionAggregate.DisconnectMessageHub;
using MySocailApp.Application.Queries.MessageAggregate;

namespace MySocailApp.Application.Hubs
{
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class MessageHub(IMediator mediator) : Hub
    {
        private readonly IMediator _mediator = mediator;

        public override async Task OnConnectedAsync()
            => await _mediator.Send(new ConnectMessageHubDto(Context.ConnectionId));
        public override async Task OnDisconnectedAsync(Exception? exception)
            => await _mediator.Send(new DisconnectMessageHubDto());

        public async Task<MessageResponseDto> CreateMessage(CreateMessageDto request)
            => await _mediator.Send(request);

        public async Task AddReceiverToMessage(AddReceiverToMessageDto request)
            => await _mediator.Send(request);
        public async Task AddViewerToMessage(AddViewerToMessageDto request)
            => await _mediator.Send(request);

        public async Task MarkMessagesAsReceived(MarkMessagesAsReceivedDto request)
            => await _mediator.Send(request);
        public async Task MarkMessagesAsViewed(MarkMessagesAsViewedDto request)
            => await _mediator.Send(request);
    }
}
