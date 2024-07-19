using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Repositories;

namespace MySocailApp.Application.Commands.SolutionAggregate.MakeDownvote
{
    public class MakeDownVoteHandler(ISolutionWriteRepository writeRepository, IAccessTokenReader tokenReader, IUnitOfWork unitOfWork) : IRequestHandler<MakeDownvoteDto>
    {
        private readonly ISolutionWriteRepository _writeRepository = writeRepository;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MakeDownvoteDto request, CancellationToken cancellationToken)
        {
            var voterId = _tokenReader.GetRequiredAccountId();
            var solution =
                await _writeRepository.GetByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionIsNotFoundException();
            solution.MakeDownvote(voterId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
