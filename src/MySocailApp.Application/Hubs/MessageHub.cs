using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Commands.MessageAggregate.AddReceiverToMessage;
using MySocailApp.Application.Commands.MessageAggregate.AddReceiverToMessages;
using MySocailApp.Application.Commands.MessageAggregate.AddViewerToMessage;
using MySocailApp.Application.Commands.MessageAggregate.AddViewerToMessages;
using MySocailApp.Application.Commands.MessageAggregate.CreateMessage;
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

        public async Task AddReceiverToMessages(AddReceiverToMessagesDto request)
            => await _mediator.Send(request);

        public async Task AddViewerToMessage(AddViewerToMessageDto request)
            => await _mediator.Send(request);
        public async Task AddViewerToMessages(AddViewerToMessagesDto request)
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
