using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Application.Commands.UserAggregate.AcceptFollowRequest;
using MySocailApp.Application.Commands.UserAggregate.Block;
using MySocailApp.Application.Commands.UserAggregate.MakeFollowRequest;
using MySocailApp.Application.Commands.UserAggregate.MakeProfilePrivate;
using MySocailApp.Application.Commands.UserAggregate.MakeProfilePublic;
using MySocailApp.Application.Commands.UserAggregate.RemoveFollower;
using MySocailApp.Application.Commands.UserAggregate.Unblock;
using MySocailApp.Application.Commands.UserAggregate.Unfollow;
using MySocailApp.Application.Commands.UserAggregate.UpdateBirthDate;
using MySocailApp.Application.Commands.UserAggregate.UpdateGender;
using MySocailApp.Application.Commands.UserAggregate.UpdateName;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Application.Queries.UserAggregate.GetById;

namespace MySocailApp.Api.Controllers
{
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class UsersController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

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
        public async Task UpdateName(UpdateNameDto request,CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        public async Task UpdateGender(UpdateGenderDto request,CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        public async Task UpdateBirthDate(UpdateBirthDateDto request,CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        public async Task MakeFollowRequest(MakeFollowRequestDto request,CancellationToken cancellationToken)
        {
            await _mediator.Send(request,cancellationToken);
        }

        [HttpPut]
        public async Task Unfollow(UnfollowDto request,CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        public async Task RemoveFollower(RemoveFollowerDto request,CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        public async Task AcceptFollowRequest(AcceptFollowRequestDto request,CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        public async Task Block(BlockDto request,CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        public async Task Unblock(UnblockDto request, CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }

        [HttpGet("{id}")]
        public async Task<UserResponseDto> GetById(string id,CancellationToken cancellationToken)
        {
            return await _mediator.Send(new GetByIdDto(id), cancellationToken);
        }
    }
}
