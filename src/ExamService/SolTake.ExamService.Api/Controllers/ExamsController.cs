using MassTransit.Mediator;
using Microsoft.AspNetCore.Mvc;
using SolTake.ExamService.Application.ApplicationServices.Create;
using SolTake.ExamService.Application.ApplicationServices.Exist;
using SolTake.ExamService.Application.ApplicationServices.GetById;

namespace SolTake.ExamService.Api.Controllers
{
    [Route("api/v1/[controller]/[action]")]
    [ApiController]
    public class ExamsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task Create(CreateDto request, CancellationToken cancellationToken) =>
            await _mediator.Send(request,cancellationToken);

        [HttpGet("{name}")]
        public async Task<GetByIdResponseDto> Get(string name, CancellationToken cancellationToken)
        {
            var client = _mediator.CreateRequestClient<GetByIdDto>();
            var response = await client.GetResponse<GetByIdResponseDto>(new(name));
            return response.Message;
        }

        [HttpGet("{name}")]
        public async Task<bool> Exist(string name, CancellationToken cancellationToken)
        {
            var client = _mediator.CreateRequestClient<ExistDto>();
            var response = await client.GetResponse<ExistResponseDto>(new(name));
            return response.Message.Value;
        }
    }
}
