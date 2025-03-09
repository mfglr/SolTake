using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Exceptions;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.RemoveDownvote
{
    public class RemoveDownvoteHandler(IUnitOfWork unitOfWork, ISolutionUserVoteWriteRepository solutionUserVoteWriteRepository, IUserAccessor userAccessor) : IRequestHandler<RemoveDownvoteDto>
    {
        private readonly ISolutionUserVoteWriteRepository _solutionUserVoteWriteRepository = solutionUserVoteWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async Task Handle(RemoveDownvoteDto request, CancellationToken cancellationToken)
        {
            var vote =
                await _solutionUserVoteWriteRepository.GetAsync(request.solutionId, _userAccessor.User.Id, cancellationToken) ??
                throw new VoteNotFoundException();

            if (vote.Type != SolutionVoteType.Downvote)
                throw new UnexpectedVoteTypeException();

            _solutionUserVoteWriteRepository.Delete(vote);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
