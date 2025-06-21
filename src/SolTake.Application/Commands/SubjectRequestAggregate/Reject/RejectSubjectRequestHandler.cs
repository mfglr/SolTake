using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.SubjectRequestAggregate.Abstracts;
using SolTake.Domain.SubjectRequestAggregate.DomainEvents;
using SolTake.Domain.SubjectRequestAggregate.Exceptions;

namespace SolTake.Application.Commands.SubjectRequestAggregate.Reject
{
    public class RejectSubjectRequestHandler(ISubjectRequestRepository subjectRequestRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IRequestHandler<RejectSubjectRequestDto>
    {
        private readonly ISubjectRequestRepository _subjectRequestRepository = subjectRequestRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(RejectSubjectRequestDto request, CancellationToken cancellationToken)
        {
            var subjectRequest =
                await _subjectRequestRepository.GetByIdAsync(request.Id, cancellationToken) ??
                throw new SubjectRequestNotFoundException();
            subjectRequest.Reject(request.Reason);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new SubjectRequestRejectedDomainEvent(subjectRequest), cancellationToken);
        }
    }
}
