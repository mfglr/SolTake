using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Commands.MessageDomain.MessageAggregate.AddReceiverToMessage;
using MySocailApp.Application.Commands.MessageDomain.MessageAggregate.AddViewerToMessage;
using MySocailApp.Application.Commands.MessageDomain.MessageAggregate.CreateMessage;
using MySocailApp.Application.Commands.MessageDomain.MessageAggregate.MarkMessagesAsReceived;
using MySocailApp.Application.Commands.MessageDomain.MessageAggregate.MarkMessagesAsViewed;
using MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionState;
using MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ConnectMessageHub;
using MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.DisconnectMessageHub;
using MySocailApp.Application.Commands.MessageDomain.MessageUserRemoveAggregate.Create;
using MySocailApp.Application.Queries.MessageDomain;
using MySocailApp.Application.Queries.MessageDomain.GetMessageConnection;

namespace MySocailApp.Application.Hubs
{
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class MessageHub(ISender sender) : Hub
    {
        private readonly ISender _sender = sender;

        public override async Task OnConnectedAsync()
            => await _sender.Send(new ConnectMessageHubDto(Context.ConnectionId));

        public override async Task OnDisconnectedAsync(Exception? exception)
            => await _sender.Send(new DisconnectMessageHubDto());

        public async Task ChangeState(ChangeMessageConnectionStateDto request)
            => await _sender.Send(request);

        public async Task<CreateMessageResponseDto> CreateMessage(CreateMessageDto request)
            => await _sender.Send(request);

        public async Task DeleteMessage(CreateMessageUserRemoveDto request)
            => await _sender.Send(request);

        public async Task AddReceiverToMessage(AddReceiverToMessageDto request)
            => await _sender.Send(request);

        public async Task AddViewerToMessage(AddViewerToMessageDto request)
            => await _sender.Send(request);

        public async Task MarkMessagesAsReceived(MarkMessagesAsReceivedDto request)
            => await _sender.Send(request);

        public async Task MarkMessagesAsViewed(MarkMessagesAsViewedDto request)
            => await _sender.Send(request);


        //queries
        public async Task<MessageConnectionResponseDto> GetById(GetMessageConnectionDto request)
            => await _sender.Send(request);
    }
}
