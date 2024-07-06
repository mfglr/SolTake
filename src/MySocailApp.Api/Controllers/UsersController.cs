using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.UserAggregate.AcceptFollowRequest;
using MySocailApp.Application.Commands.UserAggregate.Block;
using MySocailApp.Application.Commands.UserAggregate.CancelFollowRequest;
using MySocailApp.Application.Commands.UserAggregate.MakeFollowRequest;
using MySocailApp.Application.Commands.UserAggregate.MakeProfilePrivate;
using MySocailApp.Application.Commands.UserAggregate.MakeProfilePublic;
using MySocailApp.Application.Commands.UserAggregate.RejectFollowRequest;
using MySocailApp.Application.Commands.UserAggregate.RemoveFollower;
using MySocailApp.Application.Commands.UserAggregate.RemoveUserImage;
using MySocailApp.Application.Commands.UserAggregate.Unblock;
using MySocailApp.Application.Commands.UserAggregate.UpdateBirthDate;
using MySocailApp.Application.Commands.UserAggregate.UpdateGender;
using MySocailApp.Application.Commands.UserAggregate.UpdateName;
using MySocailApp.Application.Commands.UserAggregate.UpdateUserImage;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Application.Queries.UserAggregate.GetFolloweds;
using MySocailApp.Application.Queries.UserAggregate.GetFollowedsById;
using MySocailApp.Application.Queries.UserAggregate.GetFollowers;
using MySocailApp.Application.Queries.UserAggregate.GetFollowersById;
using MySocailApp.Application.Queries.UserAggregate.GetRequesteds;
using MySocailApp.Application.Queries.UserAggregate.GetRequesters;
using MySocailApp.Application.Queries.UserAggregate.GetUser;
using MySocailApp.Application.Queries.UserAggregate.GetUserById;
using MySocailApp.Application.Queries.UserAggregate.GetUserImage;
using MySocailApp.Application.Queries.UserAggregate.GetUserImageById;
using MySocailApp.Application.Queries.UserAggregate.SearchUsers;

namespace MySocailApp.Api.Controllers
{
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class UsersController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task MakeFollowRequest(MakeFollowRequestDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task CancelFollowRequest(CancelFollowRequestDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task RemoveFollower(RemoveFollowerDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task AcceptFollowRequest(AcceptFollowRequestDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task RejectFollowRequest(RejectFollowRequestDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task UpdateImage([FromForm] IFormFile file, CancellationToken cancellationToken)
             => await _mediator.Send(new UpdateUserImageDto(file),cancellationToken);

        [HttpDelete]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task RemoveImage(CancellationToken cancellationToken)
             => await _mediator.Send(new RemoveUserImageDto(), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user")]
        public async Task MakeProfilePrivate(CancellationToken cancellationToken)
        {
            await _mediator.Send(new MakeProfilePrivateDto(), cancellationToken);
        }

        [HttpPut]
        [Authorize(Roles = "user")]
        public async Task MakeProfilePublic(CancellationToken cancellationToken)
        {
            await _mediator.Send(new MakeProfilePublicDto(), cancellationToken);
        }

        [HttpPut]
        public async Task UpdateName(UpdateNameDto request, CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        public async Task UpdateGender(UpdateGenderDto request, CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        public async Task UpdateBirthDate(UpdateBirthDateDto request, CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        public async Task Block(BlockDto request, CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        public async Task Unblock(UnblockDto request, CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }



        //Queries
        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<AppUserResponseDto> Get(CancellationToken cancellationToken)
            => await _mediator.Send(new GetUserDto(),cancellationToken);

        [HttpGet("{id}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<AppUserResponseDto> GetById(string id,CancellationToken cancellationToken)
            => await _mediator.Send(new GetUserByIdDto(id),cancellationToken);

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<FileContentResult> GetImage(CancellationToken cancellationToken)
            => File(await _mediator.Send(new GetUserImageDto(), cancellationToken), "application/octet-stream");

        [HttpGet("{userId}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<FileContentResult> GetImageById(string userId, CancellationToken cancellationToken)
            => File(await _mediator.Send(new GetUserImageById(userId), cancellationToken), "application/octet-stream");

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<List<AppUserResponseDto>> GetFollowers([FromQuery(Name = "lastId")] string? lastId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetFollowersDto(lastId), cancellationToken);

        [HttpGet("{id}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<List<AppUserResponseDto>> GetFollowersById(string id,[FromQuery(Name = "lastId")] string? lastId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetFollowersByIdDto(id,lastId), cancellationToken);

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<List<AppUserResponseDto>> GetFolloweds([FromQuery(Name = "lastId")] string? lastId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetFollowedsDto(lastId), cancellationToken);

        [HttpGet("{id}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<List<AppUserResponseDto>> GetFollowedsById(string id,[FromQuery(Name = "lastId")] string? lastId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetFollowedsByIdDto(id,lastId), cancellationToken);

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<List<AppUserResponseDto>> GetRequesters([FromQuery(Name = "lastId")] string? lastId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetRequesterDto(lastId), cancellationToken);

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<List<AppUserResponseDto>> GetRequesteds([FromQuery(Name = "lastId")] string? lastId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetRequestedsDto(lastId), cancellationToken);
        
        [HttpGet("{key}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<List<AppUserResponseDto>> Search(string key, [FromQuery(Name = "lastId")] string? lastId, CancellationToken cancellationToken)
            => await _mediator.Send(new SearchUserDto(key,lastId), cancellationToken);

       
    }
}
