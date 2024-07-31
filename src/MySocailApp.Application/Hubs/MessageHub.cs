using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Commands.ConversationContext.ConnectMessageHub;
using MySocailApp.Application.Commands.ConversationContext.CreateMessage;
using MySocailApp.Application.Commands.ConversationContext.DisconnectMessageHub;
using MySocailApp.Application.Commands.ConversationContext.MarkMessageAsReceipted;
using MySocailApp.Application.Commands.ConversationContext.MarkMessageAsViewed;
using MySocailApp.Application.Commands.ConversationContext.MarkMessagesAsReceipted;
using MySocailApp.Application.Commands.ConversationContext.MarkMessagesAsViewed;
using MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate;

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

        public async Task MarkMessageAsReceipted(MarkMessageAsReceiptedDto request)
            => await _mediator.Send(request);
        public async Task MarkMesssagesAsReceipted(MarkMessagesAsReceiptedDto request)
            => await _mediator.Send(request);

        public async Task MarkMessageAsViewed(MarkMessageAsViewedDto request)
            => await _mediator.Send(request);
        public async Task MarkMessagesAsViewed(MarkMessagesAsViewedDto request)
            => await _mediator.Send(request);

        //public async Task<IAppResponseDto> GetNewMessages(GetNewMessagesDto request)
        //{
        //    return await _sender.Send(request);
        //}
        //public async Task<IAppResponseDto> GetMessages(GetMessagesDto request)
        //{
        //    return await _sender.Send(request);
        //}
        //public async Task<IAppResponseDto> CreateMessage(CreateMessageDto request)
        //{
        //    return await _sender.Send(request);
        //}
        //public async Task<IAppResponseDto> MarkMessageAsReceived(MarkMessageAsReceivedDto request)
        //{
        //    return await _sender.Send(request);
        //}
        //public async Task MarkMessageAsViewed(MarkMessageAsViewedDto request)
        //{
        //    await _sender.Send(request);
        //}
        //public async Task SendUserWrittingNotification(Guid userId)
        //{
        //    await _sender.Send(new SendUserWrittingNotificationDto() { UserId = userId });
        //}
    }
}
