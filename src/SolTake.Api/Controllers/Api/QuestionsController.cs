﻿using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.QuestionDomain.QuestionAggregate.CreateQuestion;
using SolTake.Application.Commands.QuestionDomain.QuestionAggregate.DeleteQuestion;
using SolTake.Application.Commands.QuestionDomain.QuestionAggregate.DeleteQuestionByAdmin;
using SolTake.Application.Commands.QuestionDomain.QuestionAggregate.PublishQuestion;
using SolTake.Application.Commands.QuestionDomain.QuestionAggregate.RejectQuestion;
using SolTake.Application.Queries.QuestionDomain;
using SolTake.Application.Queries.QuestionDomain.GetAllNotPublishedQuestions;
using SolTake.Application.Queries.QuestionDomain.GetHomePageQuestions;
using SolTake.Application.Queries.QuestionDomain.GetQuestionById;
using SolTake.Application.Queries.QuestionDomain.GetQuestionsByExamId;
using SolTake.Application.Queries.QuestionDomain.GetQuestionsBySubjectId;
using SolTake.Application.Queries.QuestionDomain.GetQuestionsByTopicId;
using SolTake.Application.Queries.QuestionDomain.GetQuestionsByUserId;
using SolTake.Application.Queries.QuestionDomain.GetSolvedQuestionsByUserId;
using SolTake.Application.Queries.QuestionDomain.GetUnsolvedQuestionsByUserId;
using SolTake.Application.Queries.QuestionDomain.GetVideoQuestions;
using SolTake.Application.Queries.QuestionDomain.SearchQuestions;

namespace SolTake.Api.Controllers.Api
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class QuestionsController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<CreateQuestionResponseDto> Create([FromForm] string? content, [FromForm] int examId, [FromForm] int subjectId, [FromForm] int? topicId, [FromForm] IFormFileCollection medias, CancellationToken cancellationToken)
            => await _sender.Send(new CreateQuestionDto(examId, subjectId, topicId, content, medias), cancellationToken);

        [HttpDelete("{questionId}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task Delete(int questionId, CancellationToken cancellationToken)
            => await _sender.Send(new DeleteQuestionDto(questionId), cancellationToken);

        [HttpDelete("{questionId}")]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task DeleteByAdmin(int questionId, CancellationToken cancellationToken)
            => await _sender.Send(new DeleteQuestionByAdminDto(questionId), cancellationToken);

        [HttpPut]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task Publish(PublishQuestionDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpPut]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task Reject(RejectQuestionDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpGet("{id}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<QuestionResponseDto> GetQuestionById(int id, CancellationToken cancellationToken)
           => await _sender.Send(new GetQuestionByIdDto(id), cancellationToken);

        [HttpGet("{userId}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<QuestionResponseDto>> GetQuestionsByUserId(int userId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _sender.Send(new GetQuestionsByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet("{topicId}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<QuestionResponseDto>> GetQuestionsByTopicId(int topicId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _sender.Send(new GetQuestionsByTopicIdDto(topicId, offset, take, isDescending), cancellationToken);

        [HttpGet("{subjectId}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<QuestionResponseDto>> GetQuestionsBySubjectId(int subjectId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _sender.Send(new GetQuestionsBySubjectIdDto(subjectId, offset, take, isDescending), cancellationToken);

        [HttpGet("{examId}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<QuestionResponseDto>> GetQuestionsByExamId(int examId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _sender.Send(new GetQuestionsByExamIdDto(examId, offset, take, isDescending), cancellationToken);

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<QuestionResponseDto>> GetHomePageQuestions([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetHomePageQuestionsDto(offset, take, isDescending), cancellationToken);

        [HttpPost]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<QuestionResponseDto>> SearchQuestions(SearchQuestionsDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpGet("{userId}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<QuestionResponseDto>> GetSolvedQuestionsByUserId(int userId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _sender.Send(new GetSolvedQuestionsByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet("{userId}")]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<QuestionResponseDto>> GetUnsolvedQuestionsByUserId(int userId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
           => await _sender.Send(new GetUnsolvedQuestionsByUserIdDto(userId, offset, take, isDescending), cancellationToken);

        [HttpGet]
        [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        [ServiceFilter(typeof(VersionFiltterAttribute))]
        [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
        [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
        [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
        public async Task<List<QuestionResponseDto>> GetVideoQuestions([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetVideoQuestionsDto(offset, take, isDescending),cancellationToken);
        
        [HttpGet]
        [Authorize(Roles = "admin", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [ServiceFilter(typeof(UserFilterAttribute))]
        public async Task<List<QuestionResponseDto>> GetAllNotPublishedQuestions([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetAllNotPublishedQuestionsDto(offset, take, isDescending), cancellationToken);
    }
}
