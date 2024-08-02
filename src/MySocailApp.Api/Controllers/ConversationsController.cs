using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Queries.ConversationAggregate;
using MySocailApp.Application.Queries.ConversationAggregate.GetConversationByReceiverId;
using MySocailApp.Application.Queries.ConversationAggregate.GetConversations;
using MySocailApp.Application.Queries.ConversationAggregate.GetConversationsThatHaveUnviewedMessages;

namespace MySocailApp.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailConfirmationFilterAttribute))]
    public class ConversationsController(IMediator meditaor) : ControllerBase
    {
        private readonly IMediator _meditaor = meditaor;

        [HttpGet]
        public async Task<List<ConversationResponseDto>> GetConversationsThatHaveUnviewedMessages(CancellationToken cancellationToken)
            => await _meditaor.Send(new GetConversationsThatHaveUnviewedMessagesDto(), cancellationToken);
        [HttpGet]
        public async Task<List<ConversationResponseDto>> GetConversations([FromQuery]DateTime? lastValue, [FromQuery]int? take,[FromQuery]int? takeMessage, CancellationToken cancellationToken)
            => await _meditaor.Send(new GetConversationsDto(lastValue, take,takeMessage), cancellationToken);
        [HttpGet("{receiverId}")]
        public async Task<ConversationResponseDto?> GetConversationByReceiverId(int receiverId,[FromQuery]int? takeMessage,CancellationToken cancellationToken)
            => await _meditaor.Send(new GetConversationByReceiverIdDto(receiverId,takeMessage), cancellationToken);
    }
}
