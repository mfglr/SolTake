﻿using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Domain.SolutionAggregate.Exceptions;
using SolTake.Domain.SolutionUserVoteAggregate.Abstracts;
using SolTake.Domain.SolutionUserVoteAggregate.Entities;
using SolTake.Domain.SolutionUserVoteAggregate.Exceptions;
using SolTake.Core;
using SolTake.Domain.SolutionAggregate.Abstracts;

namespace SolTake.Domain.SolutionUserVoteAggregate.DomainServices
{
    public class SolutionVoterDomainService(ISolutionReadRepository solutionReadRepository, ISolutionUserVoteWriteRepository solutionUserVoteWriteRepository)
    {
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly ISolutionUserVoteWriteRepository _solutionUserVoteWriteRepository = solutionUserVoteWriteRepository;

        public async Task UpvoteAsync(SolutionUserVote solutionUserVote, Login login, CancellationToken cancellationToken)
        {
            var solution =
                await _solutionReadRepository.GetAsync(solutionUserVote.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();

            var prevVote = await _solutionUserVoteWriteRepository.GetAsync(solutionUserVote.SolutionId, solutionUserVote.UserId, cancellationToken);
            if (prevVote != null && prevVote.Type == SolutionVoteType.Upvote)
                throw new SolutionUpvotedBeforeException();

            if (prevVote != null && prevVote.Type == SolutionVoteType.Downvote)
                _solutionUserVoteWriteRepository.Delete(prevVote);

            solutionUserVote.Create(solution, login);
        }

        public async Task DownvoteAsync(SolutionUserVote solutionUserVote, Login login, CancellationToken cancellationToken)
        {
            var solution =
                await _solutionReadRepository.GetAsync(solutionUserVote.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();

            var prevVote = await _solutionUserVoteWriteRepository.GetAsync(solutionUserVote.SolutionId, solutionUserVote.UserId, cancellationToken);
            if (prevVote != null && prevVote.Type == SolutionVoteType.Downvote)
                throw new SolutionDownvotedBeforeException();

            if (prevVote != null && prevVote.Type == SolutionVoteType.Upvote)
                _solutionUserVoteWriteRepository.Delete(prevVote);

            solutionUserVote.Create(solution, login);
        }
    }
}
