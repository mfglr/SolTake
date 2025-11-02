using MassTransit.Mediator;
using Microsoft.AspNetCore.Mvc;
using SolTake.QuestionService.Application.UseCases.Create;

namespace SolTake.QuestionService.Api.Controllers
{
    [Route("api/v1/[controller]/[action]")]
    [ApiController]
    public class QuestionsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [RequestSizeLimit(104857600)]
        [HttpPost]
        public async Task Create([FromForm] string? content, [FromForm] Guid examId, [FromForm] Guid subjectId, [FromForm] IEnumerable<string> topics, [FromForm] IFormFileCollection media, CancellationToken cancellationToken) =>
            await _mediator.Send(new CreateQuestionDto(content, examId, subjectId, topics, media), cancellationToken);
    }
}
