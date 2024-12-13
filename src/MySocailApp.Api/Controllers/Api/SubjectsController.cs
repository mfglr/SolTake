using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Queries.SubjectAggregate;
using MySocailApp.Application.Queries.SubjectAggregate.GetByExamId;
using MySocailApp.Application.Queries.SubjectAggregate.GetSubjectById;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailConfirmationFilterAttribute))]
    public class SubjectsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpGet("{examId}")]
        public async Task<List<SubjectResponseDto>> GetByExamId(int examId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSubjectsByExamIdDto(examId, offset, take, isDescending), cancellationToken);

        [HttpGet("{subjectId}")]
        public async Task<SubjectResponseDto> GetSubjectById(int subjectId, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSubjectByIdDto(subjectId), cancellationToken);
    }
}
