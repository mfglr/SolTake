using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.SubjectRequestAggregate.Approve;
using SolTake.Application.Commands.SubjectRequestAggregate.Create;
using SolTake.Application.Commands.SubjectRequestAggregate.Delete;
using SolTake.Application.Commands.SubjectRequestAggregate.Reject;
using SolTake.Application.Queries.SubjectRequestAggregate;
using SolTake.Application.Queries.SubjectRequestAggregate.GetPendingSubjectRequests;
using SolTake.Application.Queries.SubjectRequestAggregate.GetSubjectRequests;

namespace SolTake.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class SubjectRequestsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<CreateSubjectRequestResponseDto> Create(CreateSubjectRequestDto request,CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{id}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task Delete(int id,CancellationToken cancellationToken)
            => await _sender.Send(new DeleteSubjectRequestDto(id),cancellationToken);

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<SubjectRequestResponseDto>> GetSubjectRequests([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetSubjectRequestsDto(offset,take,isDescending),cancellationToken);

        [HttpPut]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task Approve(ApproveSubjectRequestDto request, CancellationToken cancellationToken)
            => await _sender.Send(request,cancellationToken);

        [HttpPut]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task Reject(RejectSubjectRequestDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);


        [HttpGet]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<List<SubjectRequestResponseDto>> GetPendings([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetPendingSubjectRequestsDto(offset, take, isDescending), cancellationToken);
    }
}
