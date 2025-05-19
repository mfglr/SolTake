using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.CommentDomain.CommentAggregate.CreateComment;
using MySocailApp.Application.Commands.CommentDomain.CommentAggregate.DeleteComment;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentById;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentsByIds;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentsByParentId;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentsByQuestionId;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentsBySolutionId;

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
    public class CommentsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<CommentResponseDto> CreateComment(CreateCommentDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpDelete("{commentId}")]
        public async Task DeleteComment(int commentId, CancellationToken cancellationToken)
            => await _mediator.Send(new DeleteCommentDto(commentId), cancellationToken);

        [HttpGet("{id}")]
        public async Task<CommentResponseDto> GetCommentById(int id, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentByIdDto(id), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<CommentResponseDto>> GetCommentsByQuestionId(int questionId, [FromQuery] int? offset, [FromQuery] int take,
            [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentsByQuestionIdDto(questionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{solutionId}")]
        public async Task<List<CommentResponseDto>> GetCommentsBySolutionId(int solutionId, [FromQuery] int? offset, [FromQuery] int take,
            [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentsBySolutionIdDto(solutionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{parentId}")]
        public async Task<List<CommentResponseDto>> GetCommentsByParentId(int parentId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentsByParentIdDto(parentId, offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<List<CommentResponseDto>> GetCommentsByIds([FromQuery] string ids, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCommentsByIdsDto(ids.Split(",").Select(int.Parse)), cancellationToken);
    }
}
