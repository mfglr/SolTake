using MediatR;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Application.Queries.BalanceAggregate.GetBalance;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class BalancesController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpGet("{id}")]
        public async Task<BalanceResponseDto> GetBalance(int id,CancellationToken cancellationToken)
            => await _sender.Send(new GetBalanceDto(id),cancellationToken);
    }
}
