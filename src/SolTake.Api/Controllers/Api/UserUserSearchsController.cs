using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using SolTake.Application.Commands.UserDomain.UserUserSearchAggregate.Create;
using SolTake.Application.Commands.UserDomain.UserUserSearchAggregate.Delete;
using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Application.Queries.UserDomain.GetUsersSearched;

namespace MySocailApp.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class UserUserSearchsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<CreateUserUserSearchResponseDto> Create(CreateUserUserSearchDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{searchedId}")]
        public async Task Delete(int searchedId, CancellationToken cancellationToken)
            => await _sender.Send(new DeleteUserUserSearchDto(searchedId), cancellationToken);

        [HttpGet]
        public async Task<List<UserUserSearchResponseDto>> Get([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetUsersSearchedDto(offset, take, isDescending), cancellationToken);
    }
}
