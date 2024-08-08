using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.CommentAggregate.Create;
using MySocailApp.Application.Commands.QuestionCommentAggregate.DislikeQuestionComment;
using MySocailApp.Application.Commands.QuestionCommentAggregate.LikeQuestionComment;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentById;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentLikes;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentsByParentId;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentsByQuestionId;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentsBySolutionId;
using MySocailApp.Application.Queries.UserAggregate;

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
        public async Task<CommentResponseDto> CreateComment(CreateCommentDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request,cancellationToken);
        [HttpPut]
        public async Task LikeComment(LikeQuestionCommentDto request,CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);
        [HttpPut]
        public async Task DislikeComment(DislikeQuestionCommentDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);


        [HttpGet("{id}")]
        public async Task<CommentResponseDto> GetCommentById(int id,CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentByIdDto(id),cancellationToken);
        [HttpGet("{questionId}")]
        public async Task<List<CommentResponseDto>> GetCommentsByQuestionId(int questionId, [FromQuery]int? lastValue, [FromQuery]int? take, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentsByQuestionIdDto(questionId, lastValue, take), cancellationToken);
        [HttpGet("{solutionId}")]
        public async Task<List<CommentResponseDto>> GetCommentsBySolutionId(int solutionId, [FromQuery] int? lastValue, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentsBySolutionIdDto(solutionId, lastValue), cancellationToken);
        [HttpGet("{parentId}")]
        public async Task<List<CommentResponseDto>> GetCommentsByParentId(int parentId, [FromQuery]int? lastValue, [FromQuery]int? take, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentsByParentIdDto(parentId, lastValue, take), cancellationToken);
        [HttpGet("{commentId}")]
        public async Task<List<AppUserResponseDto>> GetCommentLikes(int commentId, [FromQuery] int? lastValue, [FromQuery] int? take, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentLikesDto(commentId, lastValue, take),cancellationToken);
    }
}
