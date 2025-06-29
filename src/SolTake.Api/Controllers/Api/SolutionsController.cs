﻿using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolution;
using SolTake.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolutionByAI;
using SolTake.Application.Commands.SolutionDomain.SolutionAggregate.DeleteSolution;
using SolTake.Application.Commands.SolutionDomain.SolutionAggregate.MarkSolutionAsCorrect;
using SolTake.Application.Commands.SolutionDomain.SolutionAggregate.MarkSolutionAsIncorrect;
using SolTake.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.CreateSolutionUserSave;
using SolTake.Application.Queries.SolutionDomain;
using SolTake.Application.Queries.SolutionDomain.GetCorrectSolutionsByQuestionId;
using SolTake.Application.Queries.SolutionDomain.GetIncorrectsSolutionsByQuestionId;
using SolTake.Application.Queries.SolutionDomain.GetPendingSolutionsByQuestionId;
using SolTake.Application.Queries.SolutionDomain.GetSolutionById;
using SolTake.Application.Queries.SolutionDomain.GetSolutionsByQuestionId;
using SolTake.Application.Queries.SolutionDomain.GetVideoSolutions;

namespace SolTake.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class SolutionsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<CreateSolutionResponseDto> Create([FromForm] string? content, [FromForm] int questionId, [FromForm] IFormFileCollection images, CancellationToken cancellationToken)
            => await _mediator.Send(new CreateSolutionDto(content, questionId, images), cancellationToken);

        [HttpPost]
        public async Task<CreateSolutionByAIResponseDto> CreateByAI(CreateSolutionByAIDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpDelete("{solutionId}")]
        public async Task Delete(int solutionId, CancellationToken cancellationToken)
            => await _mediator.Send(new DeleteSolutionDto(solutionId), cancellationToken);

        [HttpPut]
        public async Task MarkAsCorrect(MarkSolutionAsCorrectDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        public async Task MarkAsIncorrect(MarkSolutionAsIncorrectDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        public async Task<CreateSolutionUserSaveResponseDto> Save(CreateSolutionUserSaveDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpGet("{id}")]
        public async Task<SolutionResponseDto> GetSolutionById(int id, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSolutionByIdDto(id), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<SolutionResponseDto>> GetSolutionsByQuestionId(int questionId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSolutionsByQuestionIdDto(questionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<SolutionResponseDto>> GetCorrectSolutionsByQuestionId(int questionId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCorrectSolutionsByQuestionIdDto(questionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<SolutionResponseDto>> GetPendingSolutionsByQuestionId(int questionId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetPendingSolutionsByQuestionIdDto(questionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<SolutionResponseDto>> GetIncorrectSolutionsByQuestionId(int questionId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetIncorrectSolutionsByQuestionIdDto(questionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<SolutionResponseDto>> GetVideoSolutions(int questionId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetVideoSolutionsDto(questionId, offset, take, isDescending), cancellationToken);
    }
}
