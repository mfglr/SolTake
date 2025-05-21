using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Domain.SolutionUserVoteAggregate.Exceptions;
using SolTake.Domain.SolutionUserVoteAggregate.Abstracts;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.RemoveUpvote
{
    public class RemoveUpvoteHandler(IUnitOfWork unitOfWork, ISolutionUserVoteWriteRepository solutionUserVoteWriteRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<RemoveUpvoteDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ISolutionUserVoteWriteRepository _solutionUserVoteWriteRepository = solutionUserVoteWriteRepository;

        public async Task Handle(RemoveUpvoteDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var vote =
                await _solutionUserVoteWriteRepository.GetAsync(request.SolutionId, userId, cancellationToken) ??
                throw new VoteNotFoundException();

            if (vote.Type != SolutionVoteType.Upvote)
                throw new UnexpectedVoteTypeException();

            _solutionUserVoteWriteRepository.Delete(vote);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
