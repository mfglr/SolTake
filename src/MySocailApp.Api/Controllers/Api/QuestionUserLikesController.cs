using MediatR;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.DislikeQuestion;
using MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.LikeQuestion;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionUserLikesController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<LikeQuestionCommandResponseDto> Like(LikeQuestionDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{questionId}")]
        public async Task Dislike(int questionId, CancellationToken cancellationToken)
            => await _sender.Send(new DislikeQuestionDto(questionId), cancellationToken);
    }
}
