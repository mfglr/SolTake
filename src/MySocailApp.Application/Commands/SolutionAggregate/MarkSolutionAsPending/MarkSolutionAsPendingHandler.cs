using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Repositories;

namespace MySocailApp.Application.Commands.SolutionAggregate.MarkSolutionAsPending
{
    public class MarkSolutionAsPendingHandler(ISolutionWriteRepository repository, IUnitOfWork unitOfWork, IAccessTokenReader tokenReader, SolutionApproverDomainService approver) : IRequestHandler<MarkSolutionAsPendingDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly ISolutionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly SolutionApproverDomainService _approver = approver;

        public async Task Handle(MarkSolutionAsPendingDto request, CancellationToken cancellationToken)
        {
            var userId = _tokenReader.GetRequiredAccountId();
            var solution =
                await _repository.GetByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionIsNotFoundException();
            await _approver.MarkAsPending(solution, userId,cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
