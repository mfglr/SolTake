using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using SolTake.Application.Commands.UserDomain.UserAggregate;
using SolTake.Application.Commands.UserDomain.UserAggregate.ApprovePrivacyPolicy;
using SolTake.Application.Commands.UserDomain.UserAggregate.ApproveTermsOfUse;
using SolTake.Application.Commands.UserDomain.UserAggregate.CreateUser;
using SolTake.Application.Commands.UserDomain.UserAggregate.DeleteUser;
using SolTake.Application.Commands.UserDomain.UserAggregate.GenerateResetPasswordToken;
using SolTake.Application.Commands.UserDomain.UserAggregate.LoginByGoogle;
using SolTake.Application.Commands.UserDomain.UserAggregate.LoginByPassword;
using SolTake.Application.Commands.UserDomain.UserAggregate.LoginByRefreshToken;
using SolTake.Application.Commands.UserDomain.UserAggregate.LogOut;
using SolTake.Application.Commands.UserDomain.UserAggregate.RemoveRefreshTokens;
using SolTake.Application.Commands.UserDomain.UserAggregate.RemoveUserImage;
using SolTake.Application.Commands.UserDomain.UserAggregate.ResetPassword;
using SolTake.Application.Commands.UserDomain.UserAggregate.UpdateBiography;
using SolTake.Application.Commands.UserDomain.UserAggregate.UpdateEmail;
using SolTake.Application.Commands.UserDomain.UserAggregate.UpdateEmailVerificationToken;
using SolTake.Application.Commands.UserDomain.UserAggregate.UpdateLanguage;
using SolTake.Application.Commands.UserDomain.UserAggregate.UpdateName;
using SolTake.Application.Commands.UserDomain.UserAggregate.UpdatePassword;
using SolTake.Application.Commands.UserDomain.UserAggregate.UpdateUserImage;
using SolTake.Application.Commands.UserDomain.UserAggregate.UpdateUserName;
using SolTake.Application.Commands.UserDomain.UserAggregate.VerifyEmail;
using SolTake.Application.Queries.AccountAggregate.IsUserNameExist;
using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Application.Queries.UserDomain.GetUserById;
using MySocailApp.Application.Queries.UserDomain.GetUserByUserName;
using MySocailApp.Application.Queries.UserDomain.SearchUsers;

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
        public async Task<LoginDto> LoginByGoogle(LoginByGoogleDto request, CancellationToken cancelToken)
            => await _sender.Send(request, cancelToken);

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
        public async Task RemoveRefreshTokens(RemoveRefreshTokensDto request, CancellationToken cancellationToken)
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
