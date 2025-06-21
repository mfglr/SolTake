using SolTake.Application.InfrastructureServices;
using SolTake.Core;
using SolTake.Domain.SubjectAggregate.Abstracts;
using SolTake.Domain.SubjectAggregate.Entities;
using SolTake.Domain.SubjectRequestAggregate.DomainEvents;

namespace SolTake.Application.DomainEventConsumers.SubjectRequestApprovedDominEventConsumers.SubjectAggregate
{
    public class CreateSubject(ISubjectWriteRepository subjectWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<SubjectRequestApprovedDomainEvent>
    {
        private readonly ISubjectWriteRepository _subjectWriteRepository = subjectWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SubjectRequestApprovedDomainEvent notification, CancellationToken cancellationToken)
        {
            var subject = new Subject(notification.SubjectRequest.ExamId, notification.SubjectRequest.SubjectName.Value);
            await _subjectWriteRepository.CreateAsync(subject, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
