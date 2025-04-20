using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Queries.UserUserConversation;
using MySocailApp.Application.Queries.UserUserConversation.GetUserUserConversations;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class UserUserConversationsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        public async Task<List<UserUserConversationResponseDto>> Get([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetUserUserConversationsDto(offset, take, isDescending),cancellationToken);
    }
}
