using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Exceptions;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.RemoveUpvote
{
    public class RemoveUpvoteHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, ISolutionUserVoteWriteRepository solutionUserVoteWriteRepository) : IRequestHandler<RemoveUpvoteDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ISolutionUserVoteWriteRepository _solutionUserVoteWriteRepository = solutionUserVoteWriteRepository;

        public async Task Handle(RemoveUpvoteDto request, CancellationToken cancellationToken)
        {
            var vote = 
                await _solutionUserVoteWriteRepository.GetAsync(request.SolutionId,_userAccessor.User.Id, cancellationToken) ??
                throw new VoteNotFoundException();

            if (vote.Type != SolutionVoteType.Upvote)
                throw new UnexpectedVoteTypeException();

            _solutionUserVoteWriteRepository.Delete(vote);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
