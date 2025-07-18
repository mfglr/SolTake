﻿using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Domain.SolutionUserVoteAggregate.Entities;
using SolTake.Domain.SolutionUserVoteAggregate.Abstracts;
using SolTake.Domain.SolutionUserVoteAggregate.DomainServices;

namespace SolTake.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeUpvote
{
    public class MakeUpVoteHandler(IUnitOfWork unitOfWork, ISolutionUserVoteWriteRepository solutionUserVoteWriteRepository,SolutionVoterDomainService solutionVoterDomainService, IAccessTokenReader accessTokenReader) : IRequestHandler<MakeUpvoteDto, MakeUpvoteResponseDto>
    {
        private readonly SolutionVoterDomainService _solutionVoterDomainService = solutionVoterDomainService;
        private readonly ISolutionUserVoteWriteRepository _solutionUserVoteWriteRepository = solutionUserVoteWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<MakeUpvoteResponseDto> Handle(MakeUpvoteDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();
            var vote = new SolutionUserVote(request.SolutionId, login.UserId, SolutionVoteType.Upvote);
            await _solutionVoterDomainService.UpvoteAsync(vote, login, cancellationToken);
            await _solutionUserVoteWriteRepository.CreateAsync(vote, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            return new(vote.Id);
        }
    }
}
