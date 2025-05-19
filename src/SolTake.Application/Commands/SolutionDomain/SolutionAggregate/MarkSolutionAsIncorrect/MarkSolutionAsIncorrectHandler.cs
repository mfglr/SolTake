using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

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
            var login = _accessTokenReader.GetLogin();
            var solution =
                await _solutionWriteRepository.GetByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();

            await _solutionStateMarker.MarkAsIncorrectAsync(solution, login, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
