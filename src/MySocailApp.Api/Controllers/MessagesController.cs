using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.MessageAggregate.CreateMessage;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Application.Queries.MessageAggregate.GetConversations;
using MySocailApp.Application.Queries.MessageAggregate.GetMessagesByUserId;
using MySocailApp.Application.Queries.MessageAggregate.GetUnviewedMessageByReceiverId;

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
        public async Task<MessageResponseDto> CreateMessage([FromForm]int receiverId,[FromForm]string? content,[FromForm] IFormFileCollection images)
            => await _mediator.Send(new CreateMessageDto(receiverId, content, images));

        [HttpGet("{userId}")]
        public async Task<List<MessageResponseDto>> GetMessagesByUserId(int userId,[FromQuery]int? lastValue,[FromQuery]int? take,CancellationToken cancellationToken)
            => await _mediator.Send(new GetMessagesByUserIdDto(userId,lastValue,take),cancellationToken);

        [HttpGet]
        public async Task<List<MessageResponseDto>> GetConversations([FromQuery]int? lastValue, [FromQuery]int? take,CancellationToken cancellationToken)
            => await _mediator.Send(new GetConversationsDto(lastValue, take),cancellationToken);

        [HttpGet]
        public async Task<List<MessageResponseDto>> GetUnviewedMessagesByReceiverId(CancellationToken cancellationToken)
            => await _mediator.Send(new GetUnviewedMessagesByReceiverIdDto(), cancellationToken);
    }
}
