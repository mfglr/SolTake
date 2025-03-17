using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.MessageDomain.MessageUserReceiveAggregate.Create;

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
    public class MessageUserReceivesControllers(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task Create(CreateMessageUserReceiveDto request,CancellationToken cancellationToken)
            => await _sender.Send(request,cancellationToken);

    }
}
