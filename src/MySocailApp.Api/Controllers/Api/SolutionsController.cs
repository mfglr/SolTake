using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.SolutionAggregate.CreateSolution;
using MySocailApp.Application.Commands.SolutionAggregate.CreateSolutionByAI;
using MySocailApp.Application.Commands.SolutionAggregate.DeleteSolution;
using MySocailApp.Application.Commands.SolutionAggregate.MakeDownvote;
using MySocailApp.Application.Commands.SolutionAggregate.MakeUpvote;
using MySocailApp.Application.Commands.SolutionAggregate.MarkSolutionAsCorrect;
using MySocailApp.Application.Commands.SolutionAggregate.MarkSolutionAsIncorrect;
using MySocailApp.Application.Commands.SolutionAggregate.RemoveDownvote;
using MySocailApp.Application.Commands.SolutionAggregate.RemoveUpvote;
using MySocailApp.Application.Commands.SolutionAggregate.SaveSolution;
using MySocailApp.Application.Commands.SolutionAggregate.UnsaveSolution;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Application.Queries.SolutionAggregate.GetCorrectSolutionsByQuestionId;
using MySocailApp.Application.Queries.SolutionAggregate.GetIncorrectsSolutionsByQuestionId;
using MySocailApp.Application.Queries.SolutionAggregate.GetPendingSolutionsByQuestionId;
using MySocailApp.Application.Queries.SolutionAggregate.GetQuestionSolutionsThatHaveVideo;
using MySocailApp.Application.Queries.SolutionAggregate.GetSavedSolutions;
using MySocailApp.Application.Queries.SolutionAggregate.GetSolutionById;
using MySocailApp.Application.Queries.SolutionAggregate.GetSolutionDownvotes;
using MySocailApp.Application.Queries.SolutionAggregate.GetSolutionsByQuestionId;
using MySocailApp.Application.Queries.SolutionAggregate.GetSolutionUpvotes;

namespace MySocailApp.Api.Controllers.Api
{
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(CheckVersionFiltterAttribute))]
    [ServiceFilter(typeof(CheckAccountFilterAttribute))]
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
        public async Task<SaveSolutionCommandResponseDto> Save(SaveSolutionDto request,CancellationToken cancellationToken)
            => await _mediator.Send(request, cancellationToken);

        [HttpDelete("{solutionId}")]
        public async Task Unsave(int solutionId, CancellationToken cancellationToken)
            => await _mediator.Send(new UnsaveSolutionDto(solutionId),cancellationToken);

        [HttpGet("{id}")]
        public async Task<SolutionResponseDto> GetSolutionById(int id, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSolutionByIdDto(id), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<SolutionResponseDto>> GetSolutionsByQuestionId(int questionId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSolutionsByQuestionIdDto(questionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<SolutionResponseDto>> GetCorrectSolutionsByQuestionId(int questionId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetCorrectSolutionsByQuestionIdDto(questionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<SolutionResponseDto>> GetPendingSolutionsByQuestionId(int questionId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetPendingSolutionsByQuestionIdDto(questionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<SolutionResponseDto>> GetIncorrectSolutionsByQuestionId(int questionId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetIncorrectSolutionsByQuestionIdDto(questionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{solutionId}")]
        public async Task<List<SolutionUserVoteResponseDto>> GetSolutionUpvotes(int solutionId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSolutionUpvotesDto(solutionId, offset, take, isDescending), cancellationToken);

        [HttpGet("{solutionId}")]
        public async Task<List<SolutionUserVoteResponseDto>> GetSolutionDownvotes(int solutionId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSolutionDownvotesDto(solutionId, offset, take, isDescending), cancellationToken);

        [HttpGet]
        public async Task<List<SolutionUserSaveResponseDto>> GetSavedSolutions([FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetSavedSolutionsDto(offset, take, isDescending), cancellationToken);

        [HttpGet("{questionId}")]
        public async Task<List<SolutionResponseDto>> GetVideoSolutions(int questionId, [FromQuery] int offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _mediator.Send(new GetVideoSolutionsDto(questionId,offset,take,isDescending), cancellationToken);
    }
}
