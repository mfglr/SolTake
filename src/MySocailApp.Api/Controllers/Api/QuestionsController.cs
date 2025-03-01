using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.CreateQuestion;
using MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.DeleteQuestion;
using MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.SaveQuestion;
using MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.UnsaveQuestion;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetHomePageQuestions;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetQuestionById;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetQuestionsByExamId;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetQuestionsBySubjectId;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetQuestionsByTopicId;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetQuestionsByUserId;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetSavedQuestions;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetSolvedQuestionsByUserId;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetUnsolvedQuestionsByUserId;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetVideoQuestions;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.SearchQuestions;

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
    public class QuestionsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<CreateQuestionResponseDto> Create([FromForm] string? content, [FromForm] int examId, [FromForm] int subjectId, [FromForm] int? topicId, [FromForm] IFormFileCollection medias, CancellationToken cancellationToken)
            => await _sender.Send(new CreateQuestionDto(examId, subjectId, topicId, content, medias), cancellationToken);

        [HttpDelete("{questionId}")]
        public async Task Delete(int questionId, CancellationToken cancellationToken)
            => await _sender.Send(new DeleteQuestionDto(questionId), cancellationToken);

        [HttpPost]
        public async Task<SaveQuestionCommandResponseDto> SaveQuestion(SaveQuestionDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{questionId}")]
        public async Task UnsaveQuestion(int questionId, CancellationToken cancellationToken)
            => await _sender.Send(new UnsaveQuestionDto(questionId), cancellationToken);

        [HttpGet("{id}")]
        public async Task<QuestionResponseDto> GetQuestionById(int id, CancellationToken cancellationToken)
           => await _sender.Send(new GetQuestionByIdDto(id), cancellationToken);

        [HttpGet("{userId}")]
        public async Task<List<QuestionResponseDto>> GetQuestionsByUserId(int userId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _sender.Send(new GetQuestionsByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet("{topicId}")]
        public async Task<List<QuestionResponseDto>> GetQuestionsByTopicId(int topicId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _sender.Send(new GetQuestionsByTopicIdDto(topicId, offset, take, isDescending), cancellationToken);

        [HttpGet("{subjectId}")]
        public async Task<List<QuestionResponseDto>> GetQuestionsBySubjectId(int subjectId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _sender.Send(new GetQuestionsBySubjectIdDto(subjectId, offset, take, isDescending), cancellationToken);

        [HttpGet("{examId}")]
        public async Task<List<QuestionResponseDto>> GetQuestionsByExamId(int examId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _sender.Send(new GetQuestionsByExamIdDto(examId, offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<List<QuestionResponseDto>> GetHomePageQuestions([FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetHomePageQuestionsDto(offset, take, isDescending), cancellationToken);

        [HttpPost]
        public async Task<List<QuestionResponseDto>> SearchQuestions(SearchQuestionsDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpGet("{userId}")]
        public async Task<List<QuestionResponseDto>> GetSolvedQuestionsByUserId(int userId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _sender.Send(new GetSolvedQuestionsByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet("{userId}")]
        public async Task<List<QuestionResponseDto>> GetUnsolvedQuestionsByUserId(int userId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _sender.Send(new GetUnsolvedQuestionsByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<List<QuestionResponseDto>> GetVideoQuestions([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetVideoQuestionsDto(offset, take, isDescending),cancellationToken);

        [HttpGet]
        public async Task<List<QuestionUserSaveResponseDto>> GetSavedQuestions([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetSavedQuestionsDto(offset, take, isDescending), cancellationToken);
    }
}
