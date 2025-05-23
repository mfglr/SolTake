using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using SolTake.Application.Commands.AIModelAggregate.CreateAIModel;
using SolTake.Application.Commands.AIModelAggregate.DeleteAIModel;
using SolTake.Application.Commands.AIModelAggregate.UpdateAIModelCommission;
using SolTake.Application.Commands.AIModelAggregate.UpdateAIModelImage;
using SolTake.Application.Queries.AIModelAggregate;
using SolTake.Application.Queries.AIModelAggregate.GetAIModels;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class AIModelsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<CreateAIModelResponseDto> Create([FromForm]string name, [FromForm]int solPerInputToken, [FromForm]int solPerOutputToken, [FromForm]IFormFile image, [FromForm]double commission,CancellationToken cancellationToken)
            => await _sender.Send(new CreateAIModelDto(name,solPerInputToken, solPerOutputToken, commission, image), cancellationToken);

        [HttpDelete("{id}")]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task Delete(int id,CancellationToken cancellationToken)
            => await _sender.Send(new DeleteAIModelDto(id), cancellationToken);

        [HttpPost]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task UpdateImage([FromForm]int id, [FromForm]IFormFile image, CancellationToken cancellationToken)
            => await _sender.Send(new UpdateAIModelImageDto(id,image), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task UpdateCommission(UpdateAIModelCommissionDto request,CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<AIModelResponseDto>> GetAll(CancellationToken cancellationToken)
            => await _sender.Send(new GetAllAIModelsDto(), cancellationToken);
    }
}
