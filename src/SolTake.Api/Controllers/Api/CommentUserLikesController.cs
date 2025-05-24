using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.CommentDomain.CommentUserLikeAggregate.CreateCommentUserLike;
using SolTake.Application.Commands.CommentDomain.CommentUserLikeAggregate.DeleteCommentUserLike;
using SolTake.Application.Commands.CommentDomain.CommentUserLikeAggregate.LikeComment;
using SolTake.Application.Queries.CommentAggregate;
using SolTake.Application.Queries.CommentAggregate.GetCommentLikes;

namespace SolTake.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class CommentUserLikesController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<CreateCommentUserLikeResponseDto> Create(CreateCommentUserLikeDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{commentId}")]
        public async Task Delete(int commentId, CancellationToken cancellationToken)
            => await _sender.Send(new DeleteCommentUserLikeDto(commentId), cancellationToken);

        [HttpGet("{commentId}")]
        public async Task<List<CommentUserLikeResponseDto>> Get(int commentId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetCommentLikesDto(commentId, offset, take, isDescending), cancellationToken);
    }
}
