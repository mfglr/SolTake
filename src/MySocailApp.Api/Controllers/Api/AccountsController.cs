using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.AccountAggregate;
using MySocailApp.Application.Commands.AccountAggregate.ConfirmEmail;
using MySocailApp.Application.Commands.AccountAggregate.ConfirmEmailByToken;
using MySocailApp.Application.Commands.AccountAggregate.CreateAccount;
using MySocailApp.Application.Commands.AccountAggregate.DeleteAccount;
using MySocailApp.Application.Commands.AccountAggregate.LoginByFaceBook;
using MySocailApp.Application.Commands.AccountAggregate.LoginByGoogle;
using MySocailApp.Application.Commands.AccountAggregate.LoginByPassword;
using MySocailApp.Application.Commands.AccountAggregate.LoginByRefreshToken;
using MySocailApp.Application.Commands.AccountAggregate.LogOut;
using MySocailApp.Application.Commands.AccountAggregate.SendEmailConfirmationMail;
using MySocailApp.Application.Commands.AccountAggregate.UpdateEmail;
using MySocailApp.Application.Commands.AccountAggregate.UpdateEmailConfirmationToken;
using MySocailApp.Application.Commands.AccountAggregate.UpdateLanguage;
using MySocailApp.Application.Commands.AccountAggregate.UpdatePassword;
using MySocailApp.Application.Commands.AccountAggregate.UpdateUserName;
using MySocailApp.Application.Queries.AccountAggregate.IsUserNameExist;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class AccountsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<AccountDto> Create(CreateAccountDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        public async Task<AccountDto> LoginByPassword(LoginByPasswordDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        public async Task<AccountDto> LoginByRefreshToken(LoginByRefreshTokenDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        public async Task<AccountDto> LoginByFaceBook(LoginByFaceBookDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        public async Task<AccountDto> LoginByGoogle(LoginByGoogleDto request, CancellationToken cancelToken)
            => await _mediator.Send(request, cancelToken);


        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        public async Task LogOut(CancellationToken cancellationToken)
            => await _mediator.Send(new LogOutDto(), cancellationToken);

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailConfirmationFilterAttribute))]
        public async Task<AccountDto> UpdateUserName(UpdateUserNameDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        public async Task<AccountDto> UpdateEmail(UpdateEmailDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        public async Task<AccountDto> UpdatePassword(UpdatePasswordDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        public async Task UpdateEmailConfirmationToken(CancellationToken cancellationToken)
            => await _mediator.Send(new UpdateEmailConfirmationTokenDto(), cancellationToken);

        [HttpPut]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task UpdateLanguage(UpdateLanguageDto request,CancellationToken cancellationToken)
            => await _mediator.Send(request,cancellationToken);

        [HttpGet("{id}/{token}")]
        public async Task ConfirmEmail(string id, string token, CancellationToken cancellationToken)
            => await _mediator.Send(new ConfirmEmailDto(id, token), cancellationToken);

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        public async Task ConfirmEmailByToken(ConfirmEmailByTokenDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        public async Task SendEmailConfirmationMail(CancellationToken cancellationToken)
            => await _mediator.Send(new SendEmailConfirmationMailDto(), cancellationToken);

        [HttpDelete]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        public async Task Delete(CancellationToken cancellationToken)
            => await _mediator.Send(new DeleteAccountDto(), cancellationToken);

        [HttpGet("{userName}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        public async Task<bool> IsUserNameExist(string userName, CancellationToken cancellationToken)
            => await _mediator.Send(new IsUserNameExistDto(userName), cancellationToken);
    }
}
