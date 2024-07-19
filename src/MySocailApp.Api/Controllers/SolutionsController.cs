using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.SolutionAggregate.ApproveSolution;
using MySocailApp.Application.Commands.SolutionAggregate.CreateSolution;
using MySocailApp.Application.Commands.SolutionAggregate.MakeDownvote;
using MySocailApp.Application.Commands.SolutionAggregate.MakeUpvote;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Application.Queries.SolutionAggregate.GetSolutionById;
using MySocailApp.Application.Queries.SolutionAggregate.GetSolutionsByQuestionId;

namespace MySocailApp.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailConfirmationFilterAttribute))]
    public class SolutionsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;
        
        [HttpPost]
        public async Task<SolutionResponseDto> Create([FromForm]string? content, [FromForm]int questionId, [FromForm]IFormFileCollection images, CancellationToken cancellationToken)
            => await _mediator.Send(new CreateSolutionDto(content, questionId, images),cancellationToken);

        [HttpPut]
        public async Task Approve(ApproveSolutionDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        public async Task MakeUpvote(MakeUpvoteDto request,CancellationToken cancellationToken)
            => await _mediator.Send(request,cancellationToken);

        [HttpPut]
        public async Task MakeDownvote(MakeDownvoteDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpGet("{id}")]
        public async Task<SolutionResponseDto> GetById(int id, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSolutionByIdDto(id), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<SolutionResponseDto>> GetByQuestionId(int questionId,[FromQuery]int? lastId,CancellationToken cancellationToken)
            => await _mediator.Send(new GetSolutionsByQuestionIdDto(questionId,lastId), cancellationToken);
    }
}
