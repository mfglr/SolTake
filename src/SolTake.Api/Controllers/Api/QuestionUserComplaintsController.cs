using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.QuestionUserComplaintAggregate.Create;
using SolTake.Application.Commands.QuestionUserComplaintAggregate.View;
using SolTake.Application.Queries.QuestionUserComplaintAggregate;
using SolTake.Application.Queries.QuestionUserComplaintAggregate.GetUnviewedQuestionUserComplaints;

namespace SolTake.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class QuestionUserComplaintsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<CreateQuestionUserComplaintResponseDto> Create(CreateQuestionUserComplaintDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task View(ViewQuestionUserComplaintDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpGet]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<List<QuestionUserComplaintResponseDto>> GetUnviewedQuestionUserComplaints([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetUnviewedQuestionUserComplaintsDto(offset, take, isDescending), cancellationToken);
    }
}
