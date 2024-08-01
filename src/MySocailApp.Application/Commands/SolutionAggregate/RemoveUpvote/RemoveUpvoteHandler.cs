using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.Shared;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.SolutionAggregate.RemoveUpvote
{
    public class RemoveUpvoteHandler(IAccessTokenReader accessTokenReader, ISolutionWriteRepository repository, IUnitOfWork unitOfWork) : IRequestHandler<RemoveUpvoteDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(RemoveUpvoteDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var solution =
                await _repository.GetWithVotesByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();
            solution.RemoveUpvote(userId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
