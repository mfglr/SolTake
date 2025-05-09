﻿using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionUserVoteAggregate.Entities;
using MySocailApp.Domain.SolutionUserVoteAggregate.Abstracts;
using MySocailApp.Domain.SolutionUserVoteAggregate.DomainServices;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeDownvote
{
    public class MakeDownVoteHandler(IUnitOfWork unitOfWork, ISolutionUserVoteWriteRepository solutionUserVoteWriteRepository,SolutionVoterDomainService solutionVoterDomainService, IAccessTokenReader accessTokenReader) : IRequestHandler<MakeDownvoteDto, MakeDownvoteResponseDto>
    {
        private readonly SolutionVoterDomainService _solutionVoterDomainService = solutionVoterDomainService;
        private readonly ISolutionUserVoteWriteRepository _solutionUserVoteWriteRepository = solutionUserVoteWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<MakeDownvoteResponseDto> Handle(MakeDownvoteDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();
            var vote = new SolutionUserVote(request.SolutionId, login.UserId, SolutionVoteType.Downvote);
            await _solutionVoterDomainService.DownvoteAsync(vote,login,cancellationToken);
            await _solutionUserVoteWriteRepository.CreateAsync(vote,cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            return new(vote.Id);
        }
    }
}
