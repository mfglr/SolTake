using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.SubjectRequestAggregate.Abstracts;
using SolTake.Domain.SubjectRequestAggregate.DomainEvents;
using SolTake.Domain.SubjectRequestAggregate.Exceptions;

namespace SolTake.Application.Commands.SubjectRequestAggregate.Approve
{
    public class ApproveSubjectRequestHandler(ISubjectRequestRepository subjectRequestRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IRequestHandler<ApproveSubjectRequestDto>
    {
        private readonly ISubjectRequestRepository _subjectRequestRepository = subjectRequestRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(ApproveSubjectRequestDto request, CancellationToken cancellationToken)
        {
            var subjectReques =
                await _subjectRequestRepository.GetByIdAsync(request.Id, cancellationToken) ??
                throw new SubjectRequestNotFoundException();
            subjectReques.Approve();
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new SubjectRequestApprovedDomainEvent(subjectReques),cancellationToken);
        }
    }
}
