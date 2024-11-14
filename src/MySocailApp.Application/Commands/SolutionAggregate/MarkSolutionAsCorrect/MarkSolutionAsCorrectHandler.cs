using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.SolutionAggregate.MarkSolutionAsCorrect
{
    public class MarkSolutionAsCorrectHandler(ISolutionWriteRepository solutionWriteRepository, SolutionStateMarkerDomainService solutionStateMarker, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<MarkSolutionAsCorrectDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly SolutionStateMarkerDomainService _solutionStateMarker = solutionStateMarker;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MarkSolutionAsCorrectDto request, CancellationToken cancellationToken)
        {
            var markerId = _accessTokenReader.GetRequiredAccountId();
            var solution =
                await _solutionWriteRepository.GetByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();
            await _solutionStateMarker.MarkAsCorrectAsync(solution, markerId, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
