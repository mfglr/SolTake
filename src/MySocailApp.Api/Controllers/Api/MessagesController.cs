using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.MessageDomain.MessageAggregate.CreateMessage;
using MySocailApp.Application.Commands.MessageDomain.MessageAggregate.RemoveMessages;
using MySocailApp.Application.Commands.MessageDomain.MessageAggregate.RemoveMessagesByUserIds;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Application.Queries.MessageAggregate.GetConversations;
using MySocailApp.Application.Queries.MessageAggregate.GetMessageById;
using MySocailApp.Application.Queries.MessageAggregate.GetMessagesByUserId;
using MySocailApp.Application.Queries.MessageAggregate.GetUnviewedMessages;

namespace MySocailApp.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class MessagesController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<CreateMessageResponseDto> CreateMessage([FromForm] int receiverId, [FromForm] string? content, [FromForm] IFormFileCollection medias)
            => await _mediator.Send(new CreateMessageDto(receiverId, content, medias));

        [HttpDelete]
        public async Task RemoveMessages(RemoveMessagesDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpDelete]
        public async Task RemoveMessagesByUserIds(RemoveMessagesByUserIdsDto request,CancellationToken cancellationToken)
            => await _mediator.Send(request,cancellationToken);

        [HttpGet("{userId}")]
        public async Task<List<MessageResponseDto>> GetMessagesByUserId(int userId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetMessagesByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<IEnumerable<MessageResponseDto>> GetConversations([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetConversationsDto(offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<List<MessageResponseDto>> GetUnviewedMessages(CancellationToken cancellationToken)
            => await _mediator.Send(new GetUnviewedMessagesDto(), cancellationToken);

        [HttpGet("{messageId}")]
        public async Task<MessageResponseDto> GetMessageById(int messageId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetMessageByIdDto(messageId), cancellationToken);
    }
}
