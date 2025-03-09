using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.MarkSolutionAsIncorrect
{
    public class MarkSolutionAsIncorrectHandler(ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, SolutionStateMarkerDomainService solutionStateMarker, IAccessTokenReader accessTokenReader) : IRequestHandler<MarkSolutionAsIncorrectDto>
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly SolutionStateMarkerDomainService _solutionStateMarker = solutionStateMarker;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(MarkSolutionAsIncorrectDto request, CancellationToken cancellationToken)
        {
            var markerId = _accessTokenReader.GetRequiredAccountId();
            var solution =
                await _solutionWriteRepository.GetByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();

            await _solutionStateMarker.MarkAsIncorrectAsync(solution, markerId, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
