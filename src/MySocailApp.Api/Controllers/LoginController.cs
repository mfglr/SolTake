using MediatR;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Application.Commands.AccountAggregate;
using MySocailApp.Application.Commands.AccountAggregate.LoginByPassword;
using MySocailApp.Application.Commands.AccountAggregate.LoginByRefreshToken;

namespace MySocailApp.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class LoginController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<LoginResponseDto> LoginByPassword(LoginByPasswordDto request,CancellationToken cancellationToken)
        {
            return await _mediator.Send(request, cancellationToken);
        }

        [HttpPost]
        public async Task<LoginResponseDto> LoginByRefreshToken(LoginByRefreshTokenDto request,CancellationToken cancellationToken)
        {
            return await _mediator.Send(request, cancellationToken);
        }
    }
}
