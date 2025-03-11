using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.CreateCommentUserLike;
using MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.DeleteCommentUserLike;
using MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.LikeComment;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.Queries.CommentAggregate.GetCommentLikes;

namespace MySocailApp.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
    [ServiceFilter(typeof(CheckUserFilterAttribute))]
    [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
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
