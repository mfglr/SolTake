using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.SolutionAggregate.Abstracts;
using SolTake.Domain.SolutionAggregate.DomainServices;
using SolTake.Domain.SolutionAggregate.Exceptions;

namespace SolTake.Application.Commands.SolutionDomain.SolutionAggregate.MarkSolutionAsCorrect
{
    public class MarkSolutionAsCorrectHandler(ISolutionWriteRepository solutionWriteRepository, SolutionStateMarkerDomainService solutionStateMarker, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<MarkSolutionAsCorrectDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly SolutionStateMarkerDomainService _solutionStateMarker = solutionStateMarker;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MarkSolutionAsCorrectDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();
            var solution =
                await _solutionWriteRepository.GetByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();

            await _solutionStateMarker.MarkAsCorrectAsync(solution, login, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
