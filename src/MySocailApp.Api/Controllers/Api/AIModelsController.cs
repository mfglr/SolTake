using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Application.Commands.AIModelAggregate.CreateAIModel;
using MySocailApp.Application.Queries.AIModelAggregate;
using MySocailApp.Application.Queries.AIModelAggregate.GetAIModels;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class AIModelsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<CreateAIModelResponseDto> Create([FromForm]string name, [FromForm]int solPerInputToken, [FromForm]int solPerOutputToken, [FromForm]IFormFile image,CancellationToken cancellationToken)
            => await _sender.Send(new CreateAIModelDto(name,solPerInputToken, solPerOutputToken,image), cancellationToken);

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<List<AIModelResponseDto>> GetAll(CancellationToken cancellationToken)
            => await _sender.Send(new GetAllAIModelsDto(), cancellationToken);
    }
}
