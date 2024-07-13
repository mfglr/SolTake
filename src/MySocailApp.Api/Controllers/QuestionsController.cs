using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Queries.QuestionAggregate.Get;
using MySocailApp.Application.Queries.QuestionAggregate.GetQuestionById;
using MySocailApp.Application.Queries.QuestionAggregate.GetQuestionImage;
using MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsByTopicId;
using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class QuestionsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<CreateQuestionResponseDto> Create([FromForm]string? content, [FromForm]int exam, [FromForm]int subject, [FromForm]List<int> topicIds,[FromForm]IFormFileCollection images,CancellationToken cancellationToken)
            => await _mediator.Send(new CreateQuestionDto(content, (QuestionExam)exam, (QuestionSubject)subject, topicIds,images),cancellationToken);

        [HttpGet("{questionId}/{blobName}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<FileResult> GetImage(int questionId, string blobName, CancellationToken cancellationToken)
           => 
            File(
               await _mediator.Send(new GetQuestionImageDto(questionId, blobName), cancellationToken),
               "application/octet-stream"
            );

        [HttpGet("{id}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<QuestionResponseDto> GetById(int id, CancellationToken cancellationToken)
           => await _mediator.Send(new GetQuestionByIdDto(id), cancellationToken);

        [HttpGet("{userId}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<List<QuestionResponseDto>> GetByUserId(int userId, [FromQuery]int? lastId, CancellationToken cancellationToken)
           => await _mediator.Send(new GetQuestionsByUserIdDto(userId, lastId), cancellationToken);

        [HttpGet("{topicId}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<List<QuestionResponseDto>> GetByTopicId(int topicId,[FromQuery] int? lastId, CancellationToken cancellationToken)
           => await _mediator.Send(new GetQuestionsByTopicIdDto(topicId,lastId), cancellationToken);
    }
}
