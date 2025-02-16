using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion;
using MySocailApp.Application.Commands.QuestionAggregate.DeleteQuestion;
using MySocailApp.Application.Commands.QuestionAggregate.DislikeQuestion;
using MySocailApp.Application.Commands.QuestionAggregate.LikeQuestion;
using MySocailApp.Application.Commands.QuestionAggregate.SaveQuestion;
using MySocailApp.Application.Commands.QuestionAggregate.UnsaveQuestion;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Queries.QuestionAggregate.Get;
using MySocailApp.Application.Queries.QuestionAggregate.GetHomePageQuestions;
using MySocailApp.Application.Queries.QuestionAggregate.GetQuestionById;
using MySocailApp.Application.Queries.QuestionAggregate.GetQuestionLikes;
using MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsByExamId;
using MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsBySubjectId;
using MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsByTopicId;
using MySocailApp.Application.Queries.QuestionAggregate.GetSavedQuestions;
using MySocailApp.Application.Queries.QuestionAggregate.GetSolvedQuestionsByUserId;
using MySocailApp.Application.Queries.QuestionAggregate.GetUnsolvedQuestionsByUserId;
using MySocailApp.Application.Queries.QuestionAggregate.GetVideoQuestions;
using MySocailApp.Application.Queries.QuestionAggregate.SearchQuestions;

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
    public class QuestionsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<CreateQuestionResponseDto> Create([FromForm] string? content, [FromForm] int examId, [FromForm] int subjectId, [FromForm] int? topicId, [FromForm] IFormFileCollection medias, CancellationToken cancellationToken)
            => await _mediator.Send(new CreateQuestionDto(examId, subjectId, topicId, content, medias), cancellationToken);

        [HttpDelete("{questionId}")]
        public async Task Delete(int questionId, CancellationToken cancellationToken)
            => await _mediator.Send(new DeleteQuestionDto(questionId), cancellationToken);

        [HttpPost]
        public async Task<LikeQuestionCommandResponseDto> Like(LikeQuestionDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpDelete("{questionId}")]
        public async Task Dislike(int questionId, CancellationToken cancellationToken)
            => await _mediator.Send(new DislikeQuestionDto(questionId), cancellationToken);

        [HttpPost]
        public async Task<SaveQuestionCommandResponseDto> SaveQuestion(SaveQuestionDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpDelete("{questionId}")]
        public async Task UnsaveQuestion(int questionId, CancellationToken cancellationToken)
            => await _mediator.Send(new UnsaveQuestionDto(questionId), cancellationToken);

        [HttpGet("{id}")]
        public async Task<QuestionResponseDto> GetQuestionById(int id, CancellationToken cancellationToken)
           => await _mediator.Send(new GetQuestionByIdDto(id), cancellationToken);

        [HttpGet("{userId}")]
        public async Task<List<QuestionResponseDto>> GetQuestionsByUserId(int userId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _mediator.Send(new GetQuestionsByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet("{topicId}")]
        public async Task<List<QuestionResponseDto>> GetQuestionsByTopicId(int topicId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _mediator.Send(new GetQuestionsByTopicIdDto(topicId, offset, take, isDescending), cancellationToken);

        [HttpGet("{subjectId}")]
        public async Task<List<QuestionResponseDto>> GetQuestionsBySubjectId(int subjectId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _mediator.Send(new GetQuestionsBySubjectIdDto(subjectId, offset, take, isDescending), cancellationToken);

        [HttpGet("{examId}")]
        public async Task<List<QuestionResponseDto>> GetQuestionsByExamId(int examId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _mediator.Send(new GetQuestionsByExamIdDto(examId, offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<List<QuestionResponseDto>> GetHomePageQuestions([FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetHomePageQuestionsDto(offset, take, isDescending), cancellationToken);

        [HttpPost]
        public async Task<List<QuestionResponseDto>> SearchQuestions(SearchQuestionsDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpGet("{userId}")]
        public async Task<List<QuestionResponseDto>> GetSolvedQuestionsByUserId(int userId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _mediator.Send(new GetSolvedQuestionsByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet("{questionId}")]
        public Task<List<QuestionUserLikeResponseDto>> GetQuestionLikes(int questionId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => _mediator.Send(new GetQuestionLikesDto(questionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{userId}")]
        public async Task<List<QuestionResponseDto>> GetUnsolvedQuestionsByUserId(int userId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _mediator.Send(new GetUnsolvedQuestionsByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<List<QuestionResponseDto>> GetVideoQuestions([FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetVideoQuestionsDto(offset, take, isDescending),cancellationToken);

        [HttpGet]
        public async Task<List<QuestionUserSaveResponseDto>> GetSavedQuestions([FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSavedQuestionsDto(offset, take, isDescending), cancellationToken);
    }
}
