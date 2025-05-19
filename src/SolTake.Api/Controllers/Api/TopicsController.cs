using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Queries.TopicAggregate;
using MySocailApp.Application.Queries.TopicAggregate.GetBySubjectId;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class TopicsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpGet("{subjectId}")]
        public async Task<List<TopicResponseDto>> GetBySubjectId(int subjectId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetTopicsBySubjectIdDto(subjectId, offset, take, isDescending), cancellationToken);
    }
}
