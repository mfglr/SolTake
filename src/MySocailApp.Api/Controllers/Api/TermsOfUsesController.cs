using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Queries.TermsOfUseAggregate.GetLastTermsOfUse;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    public class TermsOfUsesController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpGet]
        public async Task<FileResult> GetLastTermsOfUse([FromQuery]string language, CancellationToken cancellationToken)
            => File(await _mediator.Send(new GetLastTermsOfUseDto(language), cancellationToken), "text/plain; charset=UTF-8");
    }
}
