using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Domain.SolutionUserVoteAggregate.Exceptions;
using SolTake.Domain.SolutionUserVoteAggregate.Abstracts;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.RemoveDownvote
{
    public class RemoveDownvoteHandler(IUnitOfWork unitOfWork, ISolutionUserVoteWriteRepository solutionUserVoteWriteRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<RemoveDownvoteDto>
    {
        private readonly ISolutionUserVoteWriteRepository _solutionUserVoteWriteRepository = solutionUserVoteWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(RemoveDownvoteDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var vote =
                await _solutionUserVoteWriteRepository.GetAsync(request.solutionId, userId, cancellationToken) ??
                throw new VoteNotFoundException();

            if (vote.Type != SolutionVoteType.Downvote)
                throw new UnexpectedVoteTypeException();

            _solutionUserVoteWriteRepository.Delete(vote);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
