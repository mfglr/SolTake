using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.UserDomain.UserUserBlockAggregate.Create;
using MySocailApp.Application.Commands.UserDomain.UserUserBlockAggregate.Delete;
using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Application.Queries.UserDomain.GetBlockeds;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class UserUserBlocksController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<CreateUserUserBlockResponseDto> Create(CreateUserUserBlockDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{blockedId}")]
        public async Task Delete(int blockedId, CancellationToken cancellationToken)
            => await _sender.Send(new DeleteUserUserBlockDto(blockedId),cancellationToken);

        [HttpGet]
        public async Task<List<UserUserBlockResponseDto>> GetBlockeds([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetBlockedsDto(offset,take,isDescending),cancellationToken);
    }
}
