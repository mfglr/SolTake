using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Exceptions;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeDownvote
{
    public class MakeDownVoteHandler(IUnitOfWork unitOfWork, ISolutionUserVoteWriteRepository solutionUserVoteWriteRepository, IUserAccessor userAccessor) : IRequestHandler<MakeDownvoteDto, MakeDownvoteResponseDto>
    {
        private readonly ISolutionUserVoteWriteRepository _solutionUserVoteWriteRepository = solutionUserVoteWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async Task<MakeDownvoteResponseDto> Handle(MakeDownvoteDto request, CancellationToken cancellationToken)
        {
            var vote = await _solutionUserVoteWriteRepository.GetAsync(request.SolutionId, _userAccessor.User.Id, cancellationToken);
            
            if (vote != null && vote.Type == SolutionVoteType.Downvote)
                throw new SolutionDownvotedBeforeException();

            if(vote != null)
                _solutionUserVoteWriteRepository.Delete(vote);

            vote = SolutionUserVote.GenerateDownvote(request.SolutionId, _userAccessor.User.Id);
            await _solutionUserVoteWriteRepository.CreateAsync(vote,cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new(vote.Id);
        }
    }
}
