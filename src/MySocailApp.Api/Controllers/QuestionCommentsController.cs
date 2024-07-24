using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.QuestionCommentAggregate.CreateQuestionComment;
using MySocailApp.Application.Commands.QuestionCommentAggregate.DislikeQuestionComment;
using MySocailApp.Application.Commands.QuestionCommentAggregate.LikeQuestionComment;
using MySocailApp.Application.Queries.QuestionCommentAggregate;
using MySocailApp.Application.Queries.QuestionCommentAggregate.GetQuestionCommentById;
using MySocailApp.Application.Queries.QuestionCommentAggregate.GetQuestionCommentsByQuestionId;

namespace MySocailApp.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailConfirmationFilterAttribute))]
    public class QuestionCommentsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<QuestionCommentResponseDto> Create(CreateQuestionCommentDto request,CancellationToken cancellationToken)
            => await _mediator.Send(request,cancellationToken);

        [HttpPut]
        public async Task Like(LikeQuestionCommentDto request,CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        public async Task Dislike(DislikeQuestionCommentDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpGet("{id}")]
        public async Task<QuestionCommentResponseDto> GetById(int id,CancellationToken cancellationToken)
            => await _mediator.Send(new GetQuestionCommentByIdDto(id),cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<QuestionCommentResponseDto>> GetByQuestionId(int questionId,[FromQuery]int? lastId,CancellationToken cancellationToken)
            => await _mediator.Send(new GetQuestionCommentsByQuestionIdDto(questionId,lastId),cancellationToken);
    }
}
