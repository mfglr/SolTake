using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.UserAggregate;
using MySocailApp.Application.Commands.UserAggregate.AddUserSearcher;
using MySocailApp.Application.Commands.UserAggregate.ApprovePrivacyPolicy;
using MySocailApp.Application.Commands.UserAggregate.ApproveTermsOfUse;
using MySocailApp.Application.Commands.UserAggregate.Block;
using MySocailApp.Application.Commands.UserAggregate.CreateUser;
using MySocailApp.Application.Commands.UserAggregate.DeleteUser;
using MySocailApp.Application.Commands.UserAggregate.Follow;
using MySocailApp.Application.Commands.UserAggregate.GenerateResetPasswordToken;
using MySocailApp.Application.Commands.UserAggregate.LoginByGoogle;
using MySocailApp.Application.Commands.UserAggregate.LoginByPassword;
using MySocailApp.Application.Commands.UserAggregate.LoginByRefreshToken;
using MySocailApp.Application.Commands.UserAggregate.LogOut;
using MySocailApp.Application.Commands.UserAggregate.RemoveFollower;
using MySocailApp.Application.Commands.UserAggregate.RemoveUserImage;
using MySocailApp.Application.Commands.UserAggregate.RemoveUserSearcher;
using MySocailApp.Application.Commands.UserAggregate.ResetPassword;
using MySocailApp.Application.Commands.UserAggregate.Unblock;
using MySocailApp.Application.Commands.UserAggregate.Unfollow;
using MySocailApp.Application.Commands.UserAggregate.UpdateBiography;
using MySocailApp.Application.Commands.UserAggregate.UpdateEmail;
using MySocailApp.Application.Commands.UserAggregate.UpdateEmailVerificationToken;
using MySocailApp.Application.Commands.UserAggregate.UpdateLanguage;
using MySocailApp.Application.Commands.UserAggregate.UpdateName;
using MySocailApp.Application.Commands.UserAggregate.UpdatePassword;
using MySocailApp.Application.Commands.UserAggregate.UpdateUserImage;
using MySocailApp.Application.Commands.UserAggregate.UpdateUserName;
using MySocailApp.Application.Commands.UserAggregate.VerifyEmail;
using MySocailApp.Application.Queries.AccountAggregate.IsUserNameExist;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Application.Queries.UserAggregate.GetCreateConversationPageUsers;
using MySocailApp.Application.Queries.UserAggregate.GetFollowedsById;
using MySocailApp.Application.Queries.UserAggregate.GetFollowersById;
using MySocailApp.Application.Queries.UserAggregate.GetNotFolloweds;
using MySocailApp.Application.Queries.UserAggregate.GetSearchedUsers;
using MySocailApp.Application.Queries.UserAggregate.GetUserById;
using MySocailApp.Application.Queries.UserAggregate.GetUserByUserName;
using MySocailApp.Application.Queries.UserAggregate.SearchUsers;
using MySocailApp.Core;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class UsersController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpPost]
        public async Task<FollowCommandResponseDto> Follow(FollowDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpDelete("{followedId}")]
        public async Task Unfollow(int followedId, CancellationToken cancellationToken)
            => await _mediator.Send(new UnfollowDto(followedId), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpDelete("{followerId}")]
        public async Task RemoveFollower(int followerId, CancellationToken cancellationToken)
            => await _mediator.Send(new RemoveFollowerDto(followerId), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpPost]
        public async Task<Multimedia> UpdateImage([FromForm] IFormFile file, CancellationToken cancellationToken)
             => await _mediator.Send(new UpdateUserImageDto(file), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpDelete]
        public async Task RemoveImage(CancellationToken cancellationToken)
             => await _mediator.Send(new RemoveUserImageDto(), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpPut]
        public async Task UpdateName(UpdateNameDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpPut]
        public async Task UpdateBiography(UpdateBiographyDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpPost]
        public async Task<AddUserSearcherCommandResponseDto> AddSearcher(AddUserSearcherDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpDelete("{searchedId}")]
        public async Task RemoveSearcher(int searchedId, CancellationToken cancellationToken)
            => await _mediator.Send(new RemoveUserSearcherDto(searchedId), cancellationToken);

        //Queries
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpGet("{id}")]
        public async Task<UserResponseDto> GetById(int id, CancellationToken cancellationToken)
            => await _mediator.Send(new GetUserByIdDto(id), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpGet("{userName}")]
        public async Task<UserResponseDto> GetByUserName(string userName, CancellationToken cancellationToken)
            => await _mediator.Send(new GetUserByUserNameDto(userName), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpGet("{id}")]
        public Task<List<FollowResponseDto>> GetFollowersById(int id, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => _mediator.Send(new GetFollowersByIdDto(id, offset, take, isDescending), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpGet("{id}")]
        public Task<List<FollowResponseDto>> GetFollowedsById(int id, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => _mediator.Send(new GetFollowedsByIdDto(id, offset, take, isDescending), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpGet("{id}")]
        public async Task<List<UserResponseDto>> GetNotFolloweds(int id, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetNotFollowedsDto(id, offset, take, isDescending), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpPost]
        public async Task<List<UserResponseDto>> Search(SearchUserDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpGet]
        public async Task<List<UserSearchResponseDto>> GetSearcheds([FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSearchedUsersDto(offset, take, isDescending), cancellationToken);

        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        [HttpGet]
        public async Task<List<UserResponseDto>> GetCreateConversationPageUsers([FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCreateConversationPageUsersDto(offset, take, isDescending), cancellationToken);


        //Accounts
        [HttpPost]
        public async Task<LoginDto> Create(CreateUserDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        public async Task<LoginDto> LoginByPassword(LoginByPasswordDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        public async Task<LoginDto> LoginByRefreshToken(LoginByRefreshTokenDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        public async Task<LoginDto> LoginByGoogle(LoginByGoogleDto request, CancellationToken cancelToken)
            => await _mediator.Send(request, cancelToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        public async Task LogOut(CancellationToken cancellationToken)
            => await _mediator.Send(new LogOutDto(), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task UpdateUserName(UpdateUserNameDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        public async Task UpdateEmail(UpdateEmailDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task UpdatePassword(UpdatePasswordDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        public async Task UpdateEmailVerificationToken(CancellationToken cancellationToken)
            => await _mediator.Send(new UpdateEmailVerificationTokenDto(), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task UpdateLanguage(UpdateLanguageDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task<BlockCommandResponseDto> Block(BlockDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task Unblock(UnblockDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        public async Task VerifyEmail(VerifyEmailDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        public async Task ApprovePrivacyPolicy(CancellationToken cancellationToken)
            => await _mediator.Send(new ApprovePrivacyPolicyDto(), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        public async Task ApproveTermsOfUse(CancellationToken cancellationToken)
            => await _mediator.Send(new ApproveTermsOfUse(), cancellationToken);

        [HttpPut]
        public async Task ResetPassword(ResetPasswordDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        public async Task GeneratePasswordResetToken(GenerateResetPasswordTokenDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpDelete]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        public async Task Delete(CancellationToken cancellationToken)
            => await _mediator.Send(new DeleteUserDto(), cancellationToken);

        [HttpGet("{userName}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(CheckUserFilterAttribute))]
        [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
        public async Task<bool> IsUserNameExist(string userName, CancellationToken cancellationToken)
            => await _mediator.Send(new IsUserNameExistDto(userName), cancellationToken);

    }
}
