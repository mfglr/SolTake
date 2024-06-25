using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.AccountAggregate;
using MySocailApp.Application.Commands.AccountAggregate.ConfirmEmail;
using MySocailApp.Application.Commands.AccountAggregate.ConfirmEmailByToken;
using MySocailApp.Application.Commands.AccountAggregate.CreateAccount;
using MySocailApp.Application.Commands.AccountAggregate.DeactiveAccount;
using MySocailApp.Application.Commands.AccountAggregate.DeleteAccount;
using MySocailApp.Application.Commands.AccountAggregate.SendEmailConfirmationMail;
using MySocailApp.Application.Commands.AccountAggregate.UpdateEmail;
using MySocailApp.Application.Commands.AccountAggregate.UpdateEmailConfirmationToken;
using MySocailApp.Application.Commands.AccountAggregate.UpdatePassword;
using MySocailApp.Application.Commands.AccountAggregate.UpdateUserName;
using MySocailApp.Application.Queries.AccountAggregate;
using MySocailApp.Application.Queries.AccountAggregate.GetAccountByEmail;
using MySocailApp.Application.Queries.AccountAggregate.GetAccountById;

namespace MySocailApp.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class AccountsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<LoginResponseDto> Create(CreateAccountDto request, CancellationToken cancellationToken)
        {
            return await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
        public async Task<LoginResponseDto> UpdateUserName(UpdateUserNameDto request, CancellationToken cancellationToken)
        {
            return await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        public async Task<LoginResponseDto> UpdateEmail(UpdateEmailDto request, CancellationToken cancellationToken)
        {
            return await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        public async Task<LoginResponseDto> UpdatePassword(UpdatePasswordDto request, CancellationToken cancellationToken)
        {
            return await _mediator.Send(request, cancellationToken);
        }

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        public async Task Deactive(CancellationToken cancellationToken)
        {
            await _mediator.Send(new DeactiveAccountDto(), cancellationToken);
        }

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        public async Task UpdateEmailConfirmationToken(CancellationToken cancellationToken)
        {
            await _mediator.Send(new UpdateEmailConfirmationTokenDto(), cancellationToken);
        }

        [HttpGet("{id}/{token}")]
        public async Task ConfirmEmail(string id,string token,CancellationToken cancellationToken)
        {
            await _mediator.Send(new ConfirmEmailDto(id,token), cancellationToken);
        }

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        public async Task ConfirmEmailByToken(ConfirmEmailByTokenDto request, CancellationToken cancellationToken)
        {
            await _mediator.Send(request, cancellationToken);
        }


        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        public async Task SendEmailConfirmationMail(CancellationToken cancellationToken)
        {
            await _mediator.Send(new SendEmailConfirmationMailDto(), cancellationToken);
        }

        [HttpDelete]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(SetAccountFilterAttribute))]
        public async Task Delete(CancellationToken cancellationToken)
        {
            await _mediator.Send(new DeleteAccountDto(), cancellationToken);
        }

        [HttpGet("{id}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<AccountResponseDto> GetById(string id,CancellationToken cancellationToken)
        {
            return await _mediator.Send(new GetAccountByIdDto(id), cancellationToken);
        }

        [HttpGet("{email}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<AccountResponseDto> GetByEmail(string email, CancellationToken cancellationToken)
        {
            return await _mediator.Send(new GetAccountByEmailDto(email), cancellationToken);
        }
    }
}
