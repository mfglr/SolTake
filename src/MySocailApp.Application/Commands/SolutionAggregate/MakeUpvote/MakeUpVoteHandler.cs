using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.SolutionAggregate.MakeUpvote
{
    public class MakeUpVoteHandler(IAccessTokenReader tokenReader, ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork) : IRequestHandler<MakeUpvoteDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MakeUpvoteDto request, CancellationToken cancellationToken)
        {
            int voterId = _tokenReader.GetRequiredAccountId();
            
            var solution =
                await _solutionWriteRepository.GetWithVotesByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();
            solution.MakeUpvote(voterId);
            
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
