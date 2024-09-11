using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.MessageAggregate.CreateMessage;
using MySocailApp.Application.Commands.MessageAggregate.RemoveMessage;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Application.Queries.MessageAggregate.GetConversations;
using MySocailApp.Application.Queries.MessageAggregate.GetMessageById;
using MySocailApp.Application.Queries.MessageAggregate.GetMessageImage;
using MySocailApp.Application.Queries.MessageAggregate.GetMessagesByUserId;
using MySocailApp.Application.Queries.MessageAggregate.GetUnviewedMessages;

namespace MySocailApp.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailConfirmationFilterAttribute))]
    public class MessagesController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<MessageResponseDto> CreateMessage([FromForm] int receiverId, [FromForm] string? content, [FromForm] IFormFileCollection images)
            => await _mediator.Send(new CreateMessageDto(receiverId, content, images));

        [HttpDelete("{messageId}")]
        public async Task RemoveMessage(int messageId, CancellationToken cancellationToken)
            => await _mediator.Send(new RemoveMessageDto(messageId), cancellationToken);

        [HttpGet("{userId}")]
        public async Task<List<MessageResponseDto>> GetMessagesByUserId(int userId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetMessagesByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<List<MessageResponseDto>> GetConversations([FromQuery]int? offset, [FromQuery]int take, [FromQuery]bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetConversationsDto(offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<List<MessageResponseDto>> GetUnviewedMessages(CancellationToken cancellationToken)
            => await _mediator.Send(new GetUnviewedMessagesDto(), cancellationToken);

        [HttpGet("{messageId}")]
        public async Task<MessageResponseDto> GetMessageById(int messageId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetMessageByIdDto(messageId), cancellationToken);

        [HttpGet("{messageId}/{messageImageId}")]
        public async Task<FileResult> GetMessageImage(int messageId, int messageImageId, CancellationToken cancellationToken)
            => File(
                await _mediator.Send(new GetMessageImageDto(messageId, messageImageId), cancellationToken),
                "application/octet-stream"
            );
    }
}
