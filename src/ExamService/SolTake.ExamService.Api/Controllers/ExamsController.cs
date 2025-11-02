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

        [HttpGet("{id}")]
        public async Task<GetByIdResponseDto> Get(Guid id, CancellationToken cancellationToken)
        {
            var client = _mediator.CreateRequestClient<GetByIdDto>();
            var response = await client.GetResponse<GetByIdResponseDto>(new(id));
            return response.Message;
        }

        [HttpGet("{id}")]
        public async Task<bool> Exist(Guid id, CancellationToken cancellationToken)
        {
            var client = _mediator.CreateRequestClient<ExistDto>();
            var response = await client.GetResponse<ExistResponseDto>(new(id));
            return response.Message.Value;
        }
    }
}
