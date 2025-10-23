using MassTransit.Mediator;
using Microsoft.AspNetCore.Mvc;
using SolTake.BlobService.Application.ApplicationServices.CreateContainer;

namespace SolTake.BlobService.Api.Controllers
{
    [Route("api/v1/[controller]/[action]")]
    [ApiController]
    public class ContainersController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task Create(CreateContainerDto request, CancellationToken cancellationToken) =>
            await _mediator.Send(request,cancellationToken);
    }
}
