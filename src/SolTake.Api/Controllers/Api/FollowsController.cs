using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.UserDomain.FollowAggregate.Follow;
using SolTake.Application.Commands.UserDomain.FollowAggregate.Unfollow;
using SolTake.Application.Commands.UserDomain.UserAggregate.RemoveFollower;
using SolTake.Application.Queries.UserDomain.GetFollowedsByUserId;
using SolTake.Application.Queries.UserDomain.GetFollowersByUserId;

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
    public class FollowsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<FollowCommandResponseDto> Follow(FollowDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{followedId}")]
        public async Task Unfollow(int followedId, CancellationToken cancellationToken)
            => await _sender.Send(new UnfollowDto(followedId), cancellationToken);
        
        [HttpDelete("{followerId}")]
        public async Task RemoveFollower(int followerId, CancellationToken cancellationToken)
            => await _sender.Send(new RemoveFollowerDto(followerId), cancellationToken);

        [HttpGet("{userId}")]
        public async Task<List<FollowResponseDto>> GetFollowersByUserId(int userId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetFollowersByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet("{userId}")]
        public async Task<List<FollowResponseDto>> GetFollowedsByUserId(int userId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetFollowedsByUserIdDto(userId, offset, take, isDescending), cancellationToken);
    }
}
