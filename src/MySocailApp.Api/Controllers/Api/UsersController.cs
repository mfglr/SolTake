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
using MySocailApp.Application.Queries.UserDomain.UserAggregate;
using MySocailApp.Application.Queries.UserDomain.UserAggregate.GetCreateConversationPageUsers;
using MySocailApp.Application.Queries.UserDomain.UserAggregate.GetSearchedUsers;
using MySocailApp.Application.Queries.UserDomain.UserAggregate.GetUserById;
using MySocailApp.Application.Queries.UserDomain.UserAggregate.GetUserByUserName;
using MySocailApp.Application.Queries.UserDomain.UserAggregate.SearchUsers;
using MySocailApp.Core;

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
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        public async Task LogOut(CancellationToken cancellationToken)
            => await _sender.Send(new LogOutDto(), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task UpdateUserName(UpdateUserNameDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        public async Task UpdateEmail(UpdateEmailDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task UpdatePassword(UpdatePasswordDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        public async Task UpdateEmailVerificationToken(CancellationToken cancellationToken)
            => await _sender.Send(new UpdateEmailVerificationTokenDto(), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task UpdateLanguage(UpdateLanguageDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        public async Task VerifyEmail(VerifyEmailDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        public async Task ApprovePrivacyPolicy(CancellationToken cancellationToken)
            => await _sender.Send(new ApprovePrivacyPolicyDto(), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
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
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        public async Task Delete(CancellationToken cancellationToken)
            => await _sender.Send(new DeleteUserDto(), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpPost]
        public async Task<Multimedia> UpdateImage([FromForm] IFormFile file, CancellationToken cancellationToken)
             => await _sender.Send(new UpdateUserImageDto(file), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpDelete]
        public async Task RemoveImage(CancellationToken cancellationToken)
             => await _sender.Send(new RemoveUserImageDto(), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpPut]
        public async Task UpdateName(UpdateNameDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpPut]
        public async Task UpdateBiography(UpdateBiographyDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);
     
        //Queries
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpGet("{id}")]
        public async Task<UserResponseDto> GetById(int id, CancellationToken cancellationToken)
            => await _sender.Send(new GetUserByIdDto(id), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpGet("{userName}")]
        public async Task<UserResponseDto> GetByUserName(string userName, CancellationToken cancellationToken)
            => await _sender.Send(new GetUserByUserNameDto(userName), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpPost]
        public async Task<List<UserResponseDto>> Search(SearchUserDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpGet]
        public async Task<List<UserSearchResponseDto>> GetSearcheds([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetSearchedUsersDto(offset, take, isDescending), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpGet]
        public async Task<List<UserResponseDto>> GetCreateConversationPageUsers([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetCreateConversationPageUsersDto(offset, take, isDescending), cancellationToken);

        [HttpGet("{userName}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task<bool> IsUserNameExist(string userName, CancellationToken cancellationToken)
            => await _sender.Send(new IsUserNameExistDto(userName), cancellationToken);
    }
}
