using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Core;
using SolTake.Domain.ExamAggregate.DomainEvents;
using SolTake.Domain.ExamAggregate.Entitities;
using SolTake.Domain.ExamAggregate.Interfaces;
using SolTake.Domain.ExamAggregate.ValueObjects;
using SolTake.Domain.ExamRequestAggregate.DomainEvents;

namespace SolTake.Application.DomainEventConsumers.ExamRequestApprovedDomainEventConsumers.ExamAggregate
{
    public class CreateExam(IExamWriteRepository examWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<ExamRequestApprovedDomainEvent>
    {
        private readonly IExamWriteRepository _examWriteRepository = examWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(ExamRequestApprovedDomainEvent notification, CancellationToken cancellationToken)
        {
            var initialism = new ExamInitialism(notification.ExamRequest.Initialism.Value);
            var name = new ExamName(notification.ExamRequest.Name.Value);

            var exam = new Exam(initialism, name);
            exam.Create();
            await _examWriteRepository.CreateAsync(exam, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new ExamCreatedDomainEvent(notification.ExamRequest, exam),cancellationToken);
        }
    }
}
