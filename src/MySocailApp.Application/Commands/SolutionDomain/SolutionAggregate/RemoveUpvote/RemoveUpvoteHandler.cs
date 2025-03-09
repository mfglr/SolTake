using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.RemoveUpvote
{
    public class RemoveUpvoteHandler(IAccessTokenReader accessTokenReader, ISolutionWriteRepository repository, IUnitOfWork unitOfWork) : IRequestHandler<RemoveUpvoteDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(RemoveUpvoteDto request, CancellationToken cancellationToken)
        {
            var voterId = _accessTokenReader.GetRequiredAccountId();
            var solution =
                await _repository.GetWithVoteByIdAsync(request.SolutionId, voterId, cancellationToken) ??
                throw new SolutionNotFoundException();

            solution.RemoveUpvote(voterId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
