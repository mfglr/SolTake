using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.UserAggregate.AddUserSearcher;
using MySocailApp.Application.Commands.UserAggregate.Follow;
using MySocailApp.Application.Commands.UserAggregate.RemoveFollower;
using MySocailApp.Application.Commands.UserAggregate.RemoveUserImage;
using MySocailApp.Application.Commands.UserAggregate.RemoveUserSearcher;
using MySocailApp.Application.Commands.UserAggregate.Unfollow;
using MySocailApp.Application.Commands.UserAggregate.UpdateBiography;
using MySocailApp.Application.Commands.UserAggregate.UpdateName;
using MySocailApp.Application.Commands.UserAggregate.UpdateUserImage;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Application.Queries.UserAggregate.GetCreateConversationPageUsers;
using MySocailApp.Application.Queries.UserAggregate.GetFollowedsById;
using MySocailApp.Application.Queries.UserAggregate.GetFollowersById;
using MySocailApp.Application.Queries.UserAggregate.GetNotFolloweds;
using MySocailApp.Application.Queries.UserAggregate.GetSearchedUsers;
using MySocailApp.Application.Queries.UserAggregate.GetUserById;
using MySocailApp.Application.Queries.UserAggregate.GetUserByUserName;
using MySocailApp.Application.Queries.UserAggregate.GetUserImageById;
using MySocailApp.Application.Queries.UserAggregate.SearchUsers;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckVersionFilterAttribute))]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailConfirmationFilterAttribute))]
    public class UsersController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<FollowCommandResponseDto> Follow(FollowDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpDelete("{followedId}")]
        public async Task Unfollow(int followedId, CancellationToken cancellationToken)
            => await _mediator.Send(new UnfollowDto(followedId), cancellationToken);

        [HttpDelete("{followerId}")]
        public async Task RemoveFollower(int followerId, CancellationToken cancellationToken)
            => await _mediator.Send(new RemoveFollowerDto(followerId), cancellationToken);

        [HttpPost]
        public async Task UpdateImage([FromForm] IFormFile file, CancellationToken cancellationToken)
             => await _mediator.Send(new UpdateUserImageDto(file), cancellationToken);

        [HttpGet]
        public async Task<FileContentResult> RemoveImage(CancellationToken cancellationToken)
             => File(await _mediator.Send(new RemoveUserImageDto(), cancellationToken), "application/octet-stream");

        [HttpPut]
        public async Task UpdateName(UpdateNameDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        public async Task UpdateBiography(UpdateBiographyDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        public async Task<AddUserSearcherCommandResponseDto> AddSearcher(AddUserSearcherDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpDelete("{searchedId}")]
        public async Task RemoveSearcher(int searchedId, CancellationToken cancellationToken)
            => await _mediator.Send(new RemoveUserSearcherDto(searchedId), cancellationToken);

        //Queries
        [HttpGet("{id}")]
        public async Task<AppUserResponseDto> GetById(int id, CancellationToken cancellationToken)
            => await _mediator.Send(new GetUserByIdDto(id), cancellationToken);

        [HttpGet("{userName}")]
        public async Task<AppUserResponseDto> GetByUserName(string userName, CancellationToken cancellationToken)
            => await _mediator.Send(new GetUserByUserNameDto(userName), cancellationToken);

        [HttpGet("{userId}")]
        public async Task<FileContentResult> GetImageById(int userId, CancellationToken cancellationToken)
            => File(await _mediator.Send(new GetUserImageById(userId), cancellationToken), "application/octet-stream");

        [HttpGet("{id}")]
        public Task<List<FollowResponseDto>> GetFollowersById(int id, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => _mediator.Send(new GetFollowersByIdDto(id, offset, take, isDescending), cancellationToken);

        [HttpGet("{id}")]
        public Task<List<FollowResponseDto>> GetFollowedsById(int id, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => _mediator.Send(new GetFollowedsByIdDto(id, offset, take, isDescending), cancellationToken);

        [HttpGet("{id}")]
        public async Task<List<AppUserResponseDto>> GetNotFolloweds(int id, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetNotFollowedsDto(id, offset, take, isDescending), cancellationToken);

        [HttpPost]
        public async Task<List<AppUserResponseDto>> Search(SearchUserDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpGet]
        public async Task<List<UserSearchResponseDto>> GetSearcheds([FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSearchedUsersDto(offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<List<AppUserResponseDto>> GetCreateConversationPageUsers([FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCreateConversationPageUsersDto(offset, take, isDescending), cancellationToken);

    }
}
