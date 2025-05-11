using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.UserDomain.UserAggregate;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.ApprovePrivacyPolicy;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.ApproveTermsOfUse;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.CreateUser;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.DeleteUser;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.GenerateResetPasswordToken;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.LoginByGoogle;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.LoginByPassword;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.LoginByRefreshToken;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.LogOut;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.RemoveOldSecurityStamps;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.RemoveUserImage;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.ResetPassword;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateBiography;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateEmail;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateEmailVerificationToken;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateLanguage;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateName;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdatePassword;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateUserImage;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateUserName;
using MySocailApp.Application.Commands.UserDomain.UserAggregate.VerifyEmail;
using MySocailApp.Application.Queries.AccountAggregate.IsUserNameExist;
using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Application.Queries.UserDomain.GetUserById;
using MySocailApp.Application.Queries.UserDomain.GetUserByUserName;
using MySocailApp.Application.Queries.UserDomain.SearchUsers;
using System.Threading;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class UsersController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<LoginDto> Create(CreateUserDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPost]
        public async Task<LoginDto> LoginByPassword(LoginByPasswordDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPost]
        public async Task<LoginDto> LoginByRefreshToken(LoginByRefreshTokenDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPost]
        public async Task<LoginDto> LoginByGoogle(LoginByGoogleDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        public async Task RemoveOldSecurityStamps(RemoveOldSecurityStampsDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);


        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        public async Task LogOut(CancellationToken cancellationToken)
            => await _sender.Send(new LogOutDto(), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        [HttpPost]
        public async Task<UpdateUserNameResponseDto> UpdateUserName(UpdateUserNameDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        public async Task UpdateEmail(UpdateEmailDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task UpdatePassword(UpdatePasswordDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        public async Task UpdateEmailVerificationToken(CancellationToken cancellationToken)
            => await _sender.Send(new UpdateEmailVerificationTokenDto(), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task UpdateLanguage(UpdateLanguageDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        public async Task VerifyEmail(VerifyEmailDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        public async Task ApprovePrivacyPolicy(CancellationToken cancellationToken)
            => await _sender.Send(new ApprovePrivacyPolicyDto(), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        public async Task ApproveTermsOfUse(CancellationToken cancellationToken)
            => await _sender.Send(new ApproveTermsOfUse(), cancellationToken);

        [HttpPut]
        public async Task ResetPassword(ResetPasswordDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        public async Task GeneratePasswordResetToken(GenerateResetPasswordTokenDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        public async Task Delete(CancellationToken cancellationToken)
            => await _sender.Send(new DeleteUserDto(), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        [HttpPost]
        public async Task<UpdateUserImageResponseDto> UpdateImage([FromForm] IFormFile file, CancellationToken cancellationToken)
             => await _sender.Send(new UpdateUserImageDto(file), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        [HttpPost]
        public async Task<RemoveUserImageResponseDto> RemoveImage(CancellationToken cancellationToken)
             => await _sender.Send(new RemoveUserImageDto(), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        [HttpPost]
        public async Task<UpdateNameResponseDto> UpdateName(UpdateNameDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        [HttpPut]
        public async Task UpdateBiography(UpdateBiographyDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);
     
        //Queries
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        [HttpGet("{id}")]
        public async Task<UserResponseDto> GetById(int id, CancellationToken cancellationToken)
            => await _sender.Send(new GetUserByIdDto(id), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        [HttpGet("{userName}")]
        public async Task<UserResponseDto> GetByUserName(string userName, CancellationToken cancellationToken)
            => await _sender.Send(new GetUserByUserNameDto(userName), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        [HttpPost]
        public async Task<List<SearchUserResponseDto>> Search(SearchUserDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);
        
        [HttpGet("{userName}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<bool> IsUserNameExist(string userName, CancellationToken cancellationToken)
            => await _sender.Send(new IsUserNameExistDto(userName), cancellationToken);
    }
}
