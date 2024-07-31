using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Queries.ConversationContenxt.GetMessagesByConversationId;
using MySocailApp.Application.Queries.ConversationContenxt.GetUnviewedMessages;
using MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate;

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

        [HttpGet("{contactId}")]
        public async Task<List<MessageResponseDto>> GetByContactId(int contactId, [FromQuery]int? lastId, [FromQuery]int? take,CancellationToken cancellationToken)
            => await _mediator.Send(new GetMessagesByContactIdDto(contactId,lastId,take),cancellationToken);

        [HttpGet]
        public async Task<List<MessageResponseDto>> GetUnviewedMessages(CancellationToken cancellationToken)
            => await _mediator.Send(new GetUnviewedMessagesDto(),cancellationToken);

    }
}
