using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Queries.ExamAggregate;
using SolTake.Application.Queries.ExamAggregate.GetExamById;
using SolTake.Application.Queries.ExamAggregate.GetExams;
using SolTake.Application.Queries.ExamAggregate.SearchExam;

namespace SolTake.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    public class ExamsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<ExamResponseDto>> GetExams([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetExamsDto(offset, take, isDescending), cancellationToken);


        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<ExamResponseDto>> Search([FromQuery] string? key, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new SearchExamDto(key, offset, take, isDescending), cancellationToken);

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
