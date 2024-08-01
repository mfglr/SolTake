using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.Shared;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.SolutionAggregate.RemoveDownvote
{
    public class RemoveDownvoteHandler(IUnitOfWork unitOfWork, IAccessTokenReader tokenReader, ISolutionWriteRepository repository) : IRequestHandler<RemoveDownvoteDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly ISolutionWriteRepository _repository = repository;

        public async Task Handle(RemoveDownvoteDto request, CancellationToken cancellationToken)
        {
            var userId = _tokenReader.GetRequiredAccountId();
            var solution = 
                await _repository.GetWithVotesByIdAsync(request.solutionId, cancellationToken) ?? 
                throw new SolutionNotFoundException();
            solution.RemoveDownvote(userId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
