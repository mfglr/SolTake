﻿using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeDownvote;
using SolTake.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeUpvote;
using SolTake.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.RemoveDownvote;
using SolTake.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.RemoveUpvote;
using SolTake.Application.Queries.SolutionDomain;
using SolTake.Application.Queries.SolutionDomain.GetSolutionDownvotes;
using SolTake.Application.Queries.SolutionDomain.GetSolutionUpvotes;

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
    public class SolutionUserVotesController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<MakeUpvoteResponseDto> MakeUpvote(MakeUpvoteDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{solutionId}")]
        public async Task RemoveUpvote(int solutionId, CancellationToken cancellationToken)
            => await _sender.Send(new RemoveUpvoteDto(solutionId), cancellationToken);

        [HttpPost]
        public async Task<MakeDownvoteResponseDto> MakeDownvote(MakeDownvoteDto request, CancellationToken cancellationToken)
            => await _sender.Send(request, cancellationToken);

        [HttpDelete("{solutionId}")]
        public async Task RemoveDownvote(int solutionId, CancellationToken cancellationToken)
            => await _sender.Send(new RemoveDownvoteDto(solutionId), cancellationToken);


        [HttpGet("{solutionId}")]
        public async Task<List<SolutionUserVoteResponseDto>> GetUpvotes(int solutionId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetSolutionUpvotesDto(solutionId,offset,take,isDescending), cancellationToken);

        [HttpGet("{solutionId}")]
        public async Task<List<SolutionUserVoteResponseDto>> GetDownvotes(int solutionId, [FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetSolutionDownvotesDto(solutionId, offset, take, isDescending), cancellationToken);
    }
}
