using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolution;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolutionByAI;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.DeleteSolution;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.MakeDownvote;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.MakeUpvote;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.MarkSolutionAsCorrect;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.MarkSolutionAsIncorrect;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.RemoveDownvote;
using MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.RemoveUpvote;
using MySocailApp.Application.Commands.SolutionDomain.SolutionUserSaveAggregate.CreateSolutionUserSave;
using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Application.Queries.SolutionDomain.GetCorrectSolutionsByQuestionId;
using MySocailApp.Application.Queries.SolutionDomain.GetIncorrectsSolutionsByQuestionId;
using MySocailApp.Application.Queries.SolutionDomain.GetPendingSolutionsByQuestionId;
using MySocailApp.Application.Queries.SolutionDomain.GetSolutionById;
using MySocailApp.Application.Queries.SolutionDomain.GetSolutionDownvotes;
using MySocailApp.Application.Queries.SolutionDomain.GetSolutionsByQuestionId;
using MySocailApp.Application.Queries.SolutionDomain.GetSolutionUpvotes;
using MySocailApp.Application.Queries.SolutionDomain.GetVideoSolutions;

namespace MySocailApp.Api.Controllers.Api
{
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
    [ServiceFilter(typeof(CheckUserFilterAttribute))]
    [ServiceFilter(typeof(CheckPrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckTermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(CheckEmailVerificationFilterAttribute))]
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class SolutionsController(IMediator mediator) : ControllerBase
    {
        private readonly IMediator _mediator = mediator;

        [HttpPost]
        public async Task<CreateSolutionResponseDto> Create([FromForm] string? content, [FromForm] int questionId, [FromForm] IFormFileCollection images, CancellationToken cancellationToken)
            => await _mediator.Send(new CreateSolutionDto(content, questionId, images), cancellationToken);

        [HttpPost]
        public async Task<CreateSolutionResponseDto> CreateByAI(CreateSolutionByAIDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpDelete("{solutionId}")]
        public async Task Delete(int solutionId, CancellationToken cancellationToken)
            => await _mediator.Send(new DeleteSolutionDto(solutionId), cancellationToken);
        
        [HttpPost]
        public async Task<MakeUpvoteCommandResponseDto> MakeUpvote(MakeUpvoteDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);
        
        [HttpDelete("{solutionId}")]
        public async Task RemoveUpvote(int solutionId, CancellationToken cancellationToken)
            => await _mediator.Send(new RemoveUpvoteDto(solutionId), cancellationToken);

        [HttpPost]
        public async Task<MakeDownvoteCommandResponseDto> MakeDownvote(MakeDownvoteDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);
        
        [HttpDelete("{solutionId}")]
        public async Task RemoveDownvote(int solutionId, CancellationToken cancellationToken)
            => await _mediator.Send(new RemoveDownvoteDto(solutionId), cancellationToken);

        [HttpPut]
        public async Task MarkAsCorrect(MarkSolutionAsCorrectDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPut]
        public async Task MarkAsIncorrect(MarkSolutionAsIncorrectDto request, CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpPost]
        public async Task<CreateSolutionUserSaveResponseDto> Save(CreateSolutionUserSaveDto request,CancellationToken cancellationToken)
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

        [HttpGet("{solutionId}")]
        public async Task<List<SolutionUserVoteResponseDto>> GetSolutionUpvotes(int solutionId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSolutionUpvotesDto(solutionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{solutionId}")]
        public async Task<List<SolutionUserVoteResponseDto>> GetSolutionDownvotes(int solutionId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSolutionDownvotesDto(solutionId, offset, take, isDescending), cancellationToken);
     
        [HttpGet("{questionId}")]
        public async Task<List<SolutionResponseDto>> GetVideoSolutions(int questionId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetVideoSolutionsDto(questionId,offset,take,isDescending), cancellationToken);
    }
}
