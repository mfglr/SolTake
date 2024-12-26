using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.MessageAggregate.CreateMessage;
using MySocailApp.Application.Commands.MessageAggregate.RemoveMessage;
using MySocailApp.Application.Commands.MessageAggregate.RemoveMessages;
using MySocailApp.Application.Commands.MessageAggregate.RemoveMessagesByUserIds;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Application.Queries.MessageAggregate.GetConversations;
using MySocailApp.Application.Queries.MessageAggregate.GetMessageById;
using MySocailApp.Application.Queries.MessageAggregate.GetMessageMedia;
using MySocailApp.Application.Queries.MessageAggregate.GetMessagesByUserId;
using MySocailApp.Application.Queries.MessageAggregate.GetUnviewedMessages;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
    public class MessagesController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<MessageResponseDto> CreateMessage([FromForm] int receiverId, [FromForm] string? content, [FromForm] IFormFileCollection medias)
            => await _mediator.Send(new CreateMessageDto(receiverId, content, medias));

        [HttpDelete("{messageId}")]
        public async Task RemoveMessage(int messageId, CancellationToken cancellationToken)
            => await _mediator.Send(new RemoveMessageDto(messageId), cancellationToken);

        [HttpDelete]
        public async Task RemoveMessages(RemoveMessagesDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpDelete]
        public async Task RemoveMessagesByUserIds(RemoveMessagesByUserIdsDto request,CancellationToken cancellationToken)
            => await _mediator.Send(request,cancellationToken);

        [HttpGet("{userId}")]
        public async Task<List<MessageResponseDto>> GetMessagesByUserId(int userId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetMessagesByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<IEnumerable<MessageResponseDto>> GetConversations([FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetConversationsDto(offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<List<MessageResponseDto>> GetUnviewedMessages(CancellationToken cancellationToken)
            => await _mediator.Send(new GetUnviewedMessagesDto(), cancellationToken);

        [HttpGet("{messageId}")]
        public async Task<MessageResponseDto> GetMessageById(int messageId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetMessageByIdDto(messageId), cancellationToken);

        [HttpGet("{messageId}/{index}")]
        public async Task<FileResult> GetMessageMedia(int messageId, int index, CancellationToken cancellationToken)
            => File(
                await _mediator.Send(new GetMessageMediaDto(messageId, index), cancellationToken),
                "application/octet-stream"
            );
    }
}
