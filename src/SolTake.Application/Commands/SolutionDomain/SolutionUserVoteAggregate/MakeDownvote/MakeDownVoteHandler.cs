using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Domain.SolutionUserVoteAggregate.Entities;
using SolTake.Domain.SolutionUserVoteAggregate.Abstracts;
using SolTake.Domain.SolutionUserVoteAggregate.DomainServices;

namespace SolTake.Application.Commands.SolutionDomain.SolutionUserVoteAggregate.MakeDownvote
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
