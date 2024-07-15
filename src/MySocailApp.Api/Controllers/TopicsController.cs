using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Queries.TopicAggregate;
using MySocailApp.Application.Queries.TopicAggregate.GetBySubjectId;

namespace MySocailApp.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(SetAccountFilterAttribute))]
    [ServiceFilter(typeof(EmailConfirmedFilterAttribute))]
    public class TopicsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpGet("{subjectId}")]
        public async Task<List<TopicResponseDto>> GetBySubjectId(int subjectId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetTopicsBySubjectIdDto(subjectId), cancellationToken);
    }
}
