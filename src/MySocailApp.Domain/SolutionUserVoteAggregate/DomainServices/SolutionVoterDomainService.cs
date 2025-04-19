using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionUserVoteAggregate.Abstracts;
using MySocailApp.Domain.SolutionUserVoteAggregate.Entities;
using MySocailApp.Domain.SolutionUserVoteAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionUserVoteAggregate.DomainServices
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
