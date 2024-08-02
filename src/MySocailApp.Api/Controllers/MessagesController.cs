using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Application.Queries.MessageAggregate.GetMessagesByConversationId;
using MySocailApp.Application.Queries.MessageAggregate.GetUnviewedMessagesByConversationId;

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

        [HttpGet("{conversationId}")]
        public async Task<List<MessageResponseDto>> GetMessagesByConversationId(int conversationId, [FromQuery]int? lastValue, [FromQuery]int? take,CancellationToken cancellationToken)
            => await _mediator.Send(new GetMessagesByConversationIdDto(conversationId, lastValue, take),cancellationToken);

        [HttpGet("{conversationId}")]
        public async Task<List<MessageResponseDto>> GetUnviewedMessagesByConversationId(int conversationId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetUnviewedMessagesByConversationIdDto(conversationId),cancellationToken);

    }
}
