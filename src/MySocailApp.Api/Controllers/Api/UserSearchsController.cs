using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.UserDomain.UserSearchAggregate.CreateUserSearch;
using MySocailApp.Application.Commands.UserDomain.UserSearchAggregate.DeleteUserSearch;

namespace MySocailApp.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
    [ServiceFilter(typeof(CheckUserFilterAttribute))]
    [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
    public class UserSearchsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<CreateUserSearchResponseDto> Create(CreateUserSearchDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{searchedId}")]
        public async Task Delete(int searchedId, CancellationToken cancellationToken)
            => await _sender.Send(new DeleteUserSearchDto(searchedId), cancellationToken);
    }
}
