using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.TopicAggregate.Commands;
using SolTake.Application.Queries.TopicAggregate;
using SolTake.Application.Queries.TopicAggregate.GetBySubjectId;

namespace SolTake.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class TopicsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpGet("{subjectId}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<TopicResponseDto>> GetBySubjectId(int subjectId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetTopicsBySubjectIdDto(subjectId, offset, take, isDescending), cancellationToken);

        [HttpDelete("{id}")]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task Delete(int id,CancellationToken cancellationToken)
            => await _sender.Send(new DeleteTopicDto(id), cancellationToken);
    }
}
