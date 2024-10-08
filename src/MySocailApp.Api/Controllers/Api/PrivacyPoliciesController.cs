using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Queries.PrivacyPolicyAggregate.GetLastPrivacyPolicy;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    public class PrivacyPoliciesController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;
     
        [HttpGet]
        public async Task<FileResult> GetLastPrivacyPolicy([FromQuery]string language, CancellationToken cancellationToken)
            => File(await _mediator.Send(new GetLastPrivacyPolicyDto(language), cancellationToken), "text/plain; charset=UTF-8");
    }
}
