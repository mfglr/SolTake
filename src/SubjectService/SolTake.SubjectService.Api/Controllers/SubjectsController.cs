using MassTransit.Mediator;
using Microsoft.AspNetCore.Mvc;
using SolTake.SubjectService.Application.ApplicationServices.Create;
using SolTake.SubjectService.Application.ApplicationServices.Exist;

namespace SolTake.SubjectService.Api.Controllers
{
    [Route("api/v1/[controller]/[action]")]
    [ApiController]
    public class SubjectsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task Create(CreateDto request, CancellationToken cancellationToken) =>
            await _mediator.Send(request,cancellationToken);

        [HttpGet("{name}")]
        public async Task<bool> Exist(string name, CancellationToken cancellationToken)
        {
            var client = _mediator.CreateRequestClient<ExistDto>();
            var response = await client.GetResponse<ExistResponseDto>(new(name),cancellationToken);
            return response.Message.Value;
        }
    }
}
