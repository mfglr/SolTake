using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.SolutionAggregate.MarkSolutionAsIncorrect
{
    public class MarkSolutionAsIncorrectHandler(ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, SolutionStateMarker solutionStateMarker, IAccessTokenReader accessTokenReader) : IRequestHandler<MarkSolutionAsIncorrectDto>
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly SolutionStateMarker _solutionStateMarker = solutionStateMarker;
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
