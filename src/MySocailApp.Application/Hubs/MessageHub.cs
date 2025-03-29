using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Commands.MessageDomain.MessageAggregate.CreateMessage;
using MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToFocused;
using MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToOnline;
using MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToTyping;
using MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ConnectMessageHub;
using MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.DisconnectMessageHub;
using MySocailApp.Application.Commands.MessageDomain.MessageUserReceiveAggregate.MarkMessagesAsReceived;
using MySocailApp.Application.Commands.MessageDomain.MessageUserRemoveAggregate.Create;
using MySocailApp.Application.Commands.MessageDomain.MessageUserViewAggregate.MarkMessagesAsViewed;
using MySocailApp.Application.Queries.MessageDomain;
using MySocailApp.Application.Queries.MessageDomain.GetMessageConnection;
using MySocailApp.Application.Queries.MessageDomain.GetMessagesByUserId;
using MySocailApp.Application.Queries.MessageDomain.GetUnviewedMessages;

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
        public async Task ChangeStateToFocused(ChangeMessageConnectionStateToFocusedDto request)
            => await _sender.Send(request);
        public async Task ChangeStateToTyping(ChangeMessageConnectionStateToTypingDto request)
            => await _sender.Send(request);
        public async Task ChangeStateToOnline()
            => await _sender.Send(new ChangeMessageConnectionStateToOnlineDto());

        public async Task<CreateMessageResponseDto> CreateMessage(CreateMessageDto request)
            => await _sender.Send(request);
        public async Task DeleteMessage(CreateMessageUserRemoveDto request)
            => await _sender.Send(request);

        public async Task MarkMessagesAsReceived(MarkMessagesAsReceivedDto request)
            => await _sender.Send(request);

        public async Task MarkMessagesAsViewed(MarkMessagesAsViewedDto request)
            => await _sender.Send(request);

        //queries
        public async Task<MessageConnectionResponseDto> GetById(GetMessageConnectionDto request)
            => await _sender.Send(request);

        public async Task<List<MessageResponseDto>> GetByUserId(GetMessagesByUserIdDto request)
            => await _sender.Send(request);

        public async Task<List<MessageResponseDto>> GetUnviewedMessages(GetUnviewedMessagesDto request)
            => await _sender.Send(request);
    }
}
