using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using SolTake.Application.Commands.MessageDomain.MessageAggregate.CreateMessage;
using SolTake.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToFocused;
using SolTake.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToOnline;
using SolTake.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToTyping;
using SolTake.Application.Commands.MessageDomain.MessageConnectionAggregate.ConnectMessageHub;
using SolTake.Application.Commands.MessageDomain.MessageConnectionAggregate.DisconnectMessageHub;
using SolTake.Application.Commands.MessageDomain.MessageUserReceiveAggregate.MarkMessagesAsReceived;
using SolTake.Application.Commands.MessageDomain.MessageUserRemoveAggregate.RemoveMessages;
using SolTake.Application.Commands.MessageDomain.MessageUserRemoveAggregate.RemoveMessagesByUserIds;
using SolTake.Application.Commands.MessageDomain.MessageUserViewAggregate.MarkMessagesAsViewed;
using SolTake.Application.Queries.MessageDomain;
using SolTake.Application.Queries.MessageDomain.GetConversations;
using SolTake.Application.Queries.MessageDomain.GetMessageById;
using SolTake.Application.Queries.MessageDomain.GetMessageConnection;
using SolTake.Application.Queries.MessageDomain.GetMessagesByUserId;
using SolTake.Application.Queries.MessageDomain.GetUnviewedMessages;

namespace SolTake.Application.Hubs
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

        public async Task RemoveMessages(RemoveMessagesDto request)
            => await _sender.Send(request);

        public async Task RemoveMessagesByUserIds(RemoveMessagesByUserIdsDto request)
            => await _sender.Send(request);

        public async Task MarkMessagesAsReceived(MarkMessagesAsReceivedDto request)
            => await _sender.Send(request);

        public async Task MarkMessagesAsViewed(MarkMessagesAsViewedDto request)
            => await _sender.Send(request);

        //queries
        public async Task<MessageConnectionResponseDto> GetMessageConnectionById(GetMessageConnectionDto request)
            => await _sender.Send(request);

        public async Task<MessageResponseDto> GetMessageById(GetMessageByIdDto request)
            => await _sender.Send(request);

        public async Task<List<MessageResponseDto>> GetByUserId(GetMessagesByUserIdDto request)
            => await _sender.Send(request);

        public async Task<List<MessageResponseDto>> GetUnviewedMessages(GetUnviewedMessagesDto request)
            => await _sender.Send(request);

        public async Task<IEnumerable<MessageResponseDto>> GetConversations(GetConversationsDto request)
            => await _sender.Send(request);
    }
}
