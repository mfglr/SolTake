using MassTransit.Mediator;
using Microsoft.AspNetCore.Mvc;
using SolTake.QuestionService.Application.UseCases.Create;
using SolTake.QuestionService.Application.UseCases.MarkedQuestionAsDraft;

namespace SolTake.QuestionService.Api.Controllers
{
    [Route("api/v1/[controller]/[action]")]
    [ApiController]
    public class QuestionsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [RequestSizeLimit(104857600)]
        [HttpPost]
        public async Task Create([FromForm] string? content, [FromForm] string examName, [FromForm] string subjectName, [FromForm] IEnumerable<string> topics, [FromForm] IFormFileCollection media, CancellationToken cancellationToken) =>
            await _mediator.Send(new CreateQuestionDto(content, examName, subjectName, topics, media), cancellationToken);

        [HttpPost]
        public async Task MarkAsDraft(MarkedQuestionAsDraftDto request, CancellationToken cancellationToken) =>
            await _mediator.Send(request, cancellationToken);
    }
}
