using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.CreateSolutionUserSave;
using SolTake.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.UnsaveSolution;
using SolTake.Application.Queries.SolutionDomain;
using SolTake.Application.Queries.SolutionDomain.GetSavedSolutions;

namespace SolTake.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class SolutionUserSavesController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<CreateSolutionUserSaveResponseDto> Create(CreateSolutionUserSaveDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{solutionId}")]
        public async Task Delete(int solutionId,CancellationToken cancellationToken)
            => await _sender.Send(new DeleteSolutionUserSaveDto(solutionId), cancellationToken);

        [HttpGet]
        public async Task<List<SolutionUserSaveResponseDto>> Get([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetSolutionUserSavesDto(offset, take, isDescending), cancellationToken);
    }
}
