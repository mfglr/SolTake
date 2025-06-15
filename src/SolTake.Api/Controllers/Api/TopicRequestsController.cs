using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.TopicRequestAggregate.Aprove;
using SolTake.Application.Commands.TopicRequestAggregate.Create;
using SolTake.Application.Commands.TopicRequestAggregate.Reject;
using SolTake.Application.Queries.TopicRequestAggregate;
using SolTake.Application.Queries.TopicRequestAggregate.GetAllTopicRequests;
using SolTake.Application.Queries.TopicRequestAggregate.GetPendingTopicRequests;
using SolTake.Application.Queries.TopicRequestAggregate.GetTopicRequests;

namespace SolTake.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class TopicRequestsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<CreateTopicRequestResponseDto> Create(CreateTopicRequestDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<TopicRequestResponseDto>> GetTopicRequests([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetTopicRequestsDto(offset,take,isDescending), cancellationToken);

        [HttpGet]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<List<TopicRequestResponseDto>> GetAllTopicRequests([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetAllTopicRequestsDto(offset, take, isDescending), cancellationToken);

        [HttpGet]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<List<TopicRequestResponseDto>> GetPendingTopicRequests([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetPendingTopicRequestsDto(offset, take, isDescending), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task Approve(ApproveTopicRequestDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task Reject(RejectTopicRequestDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);
    }
}
