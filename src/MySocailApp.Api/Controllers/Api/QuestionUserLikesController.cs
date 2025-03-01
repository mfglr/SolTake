using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.DislikeQuestion;
using MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.LikeQuestion;
using MySocailApp.Application.Queries.QuestionDomain.QuestionUserLikeAggregate;
using MySocailApp.Application.Queries.QuestionDomain.QuestionUserLikeAggregate.GetQuestionLikes;

namespace MySocailApp.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckUserFilterAttribute))]
    [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
    [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
    public class QuestionUserLikesController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<LikeQuestionCommandResponseDto> Like(LikeQuestionDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{questionId}")]
        public async Task Dislike(int questionId, CancellationToken cancellationToken)
            => await _sender.Send(new DislikeQuestionDto(questionId), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<QuestionUserLikeResponseDto>> GetLikes(int questionId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetQuestionLikesDto(questionId,offset,take,isDescending), cancellationToken);
    }
}
