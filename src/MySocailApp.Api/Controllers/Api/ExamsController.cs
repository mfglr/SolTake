using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Queries.ExamAggregate;
using MySocailApp.Application.Queries.ExamAggregate.GetExams;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailConfirmationFilterAttribute))]
    public class ExamsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpGet]
        public async Task<List<ExamResponseDto>> GetExams(CancellationToken cancellationToken, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending)
            => await _mediator.Send(new GetExamsDto(offset, take, isDescending), cancellationToken);
    }
}
