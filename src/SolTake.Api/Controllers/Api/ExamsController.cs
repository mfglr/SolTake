using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.ExamAggregate.Create;
using SolTake.Application.Queries.ExamAggregate;
using SolTake.Application.Queries.ExamAggregate.GetExamById;
using SolTake.Application.Queries.ExamAggregate.GetExams;

namespace SolTake.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    public class ExamsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<CreateExamResponseDto> Create(CreateExamDto request,CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<ExamResponseDto>> GetExams([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetExamsDto(offset, take, isDescending), cancellationToken);

        [HttpGet("{examId}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<ExamResponseDto> GetExamById(int examId, CancellationToken cancellationToken)
            => await _sender.Send(new GetExamByIdDto(examId), cancellationToken);
    }
}
