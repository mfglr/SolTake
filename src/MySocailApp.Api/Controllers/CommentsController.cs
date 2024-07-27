using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.CommentAggregate.Create;
using MySocailApp.Application.Commands.QuestionCommentAggregate.DislikeQuestionComment;
using MySocailApp.Application.Commands.QuestionCommentAggregate.LikeQuestionComment;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.Queries.CommentAggregate.GetById;
using MySocailApp.Application.Queries.CommentAggregate.GetByQuestionId;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentByParentId;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentsBySolutionId;

namespace MySocailApp.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailConfirmationFilterAttribute))]
    public class CommentsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<CommentResponseDto> Create(CreateCommentDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request,cancellationToken);

        [HttpPut]
        public async Task Like(LikeQuestionCommentDto request,CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        public async Task Dislike(DislikeQuestionCommentDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpGet("{id}")]
        public async Task<CommentResponseDto> GetById(int id,CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentByIdDto(id),cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<CommentResponseDto>> GetByQuestionId(int questionId,[FromQuery]int? lastId,CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentsByQuestionIdDto(questionId, lastId), cancellationToken);
        
        [HttpGet("{solutionId}")]
        public async Task<List<CommentResponseDto>> GetBySolutionId(int solutionId, [FromQuery] int? lastId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentsBySolutionIdDto(solutionId, lastId), cancellationToken);

        [HttpGet("{parentId}")]
        public async Task<List<CommentResponseDto>> GetByParentId(int parentId, [FromQuery]int? lastId, [FromQuery]int? take, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentsByParentIdDto(parentId, lastId, take), cancellationToken);
    }
}
