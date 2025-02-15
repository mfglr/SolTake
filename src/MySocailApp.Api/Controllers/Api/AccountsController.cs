using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.AccountAggregate.ApprovePrivacyPolicy;
using MySocailApp.Application.Commands.AccountAggregate.ApproveTermsOfUse;
using MySocailApp.Application.Commands.AccountAggregate.DeleteAccount;
using MySocailApp.Application.Commands.AccountAggregate.LogOut;
using MySocailApp.Application.Commands.AccountAggregate.UpdateEmailVerificationToken;
using MySocailApp.Application.Commands.UserAggregate;
using MySocailApp.Application.Commands.UserAggregate.Block;
using MySocailApp.Application.Commands.UserAggregate.CreateAccount;
using MySocailApp.Application.Commands.UserAggregate.GenerateResetPasswordToken;
using MySocailApp.Application.Commands.UserAggregate.LoginByFaceBook;
using MySocailApp.Application.Commands.UserAggregate.LoginByGoogle;
using MySocailApp.Application.Commands.UserAggregate.LoginByPassword;
using MySocailApp.Application.Commands.UserAggregate.LoginByRefreshToken;
using MySocailApp.Application.Commands.UserAggregate.ResetPassword;
using MySocailApp.Application.Commands.UserAggregate.Unblock;
using MySocailApp.Application.Commands.UserAggregate.UpdateEmail;
using MySocailApp.Application.Commands.UserAggregate.UpdateLanguage;
using MySocailApp.Application.Commands.UserAggregate.UpdatePassword;
using MySocailApp.Application.Commands.UserAggregate.UpdateUserName;
using MySocailApp.Application.Commands.UserAggregate.VerifyEmail;
using MySocailApp.Application.Queries.AccountAggregate.IsUserNameExist;

namespace MySocailApp.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
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

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task UpdateUserName(UpdateUserNameDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        public async Task UpdateEmail(UpdateEmailDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task UpdatePassword(UpdatePasswordDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        public async Task UpdateEmailVerificationToken(CancellationToken cancellationToken)
            => await _mediator.Send(new UpdateEmailVerificationTokenDto(), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task UpdateLanguage(UpdateLanguageDto request,CancellationToken cancellationToken)
            => await _mediator.Send(request,cancellationToken);

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task<BlockCommandResponseDto> Block(BlockDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task Unblock(UnblockDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        public async Task VerifyEmail(VerifyEmailDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        public async Task ApprovePrivacyPolicy(CancellationToken cancellationToken)
            => await _mediator.Send(new ApprovePrivacyPolicyDto(), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        public async Task ApproveTermsOfUse(CancellationToken cancellationToken)
            => await _mediator.Send(new ApproveTermsOfUse(), cancellationToken);

        [HttpPut]
        public async Task ResetPassword(ResetPasswordDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        public async Task GeneratePasswordResetToken(GenerateResetPasswordTokenDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request,cancellationToken);

        [HttpDelete]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        public async Task Delete(CancellationToken cancellationToken)
            => await _mediator.Send(new DeleteAccountDto(), cancellationToken);

        [HttpGet("{userName}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckAccountFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task<bool> IsUserNameExist(string userName, CancellationToken cancellationToken)
            => await _mediator.Send(new IsUserNameExistDto(userName), cancellationToken);
    }
}
