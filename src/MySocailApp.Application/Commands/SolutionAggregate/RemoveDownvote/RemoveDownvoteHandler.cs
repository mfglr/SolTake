using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.SolutionAggregate.RemoveDownvote
{
    public class RemoveDownvoteHandler(IUnitOfWork unitOfWork, IAccessTokenReader tokenReader, ISolutionWriteRepository repository) : IRequestHandler<RemoveDownvoteDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly ISolutionWriteRepository _repository = repository;

        public async Task Handle(RemoveDownvoteDto request, CancellationToken cancellationToken)
        {
            var voterId = _tokenReader.GetRequiredAccountId();
            var solution = 
                await _repository.GetWithVoteByIdAsync(request.solutionId, voterId, cancellationToken) ?? 
                throw new SolutionNotFoundException();

            solution.RemoveDownvote(voterId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
