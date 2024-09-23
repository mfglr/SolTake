using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;
using MySocailApp.Domain.QuestionAggregate.DomainServices;

namespace MySocailApp.Application.DomainEventConsumers.QuestionDeletedDomainEventComsumers
{
    public class DeleteQuestion(IUnitOfWork unitOfWork, QuestionDeleterDomainService questionDeleterDomainService) : IDomainEventConsumer<QuestionDeletedDomainEvent>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly QuestionDeleterDomainService _questionDeleterDomainService = questionDeleterDomainService;

        public async Task Handle(QuestionDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            await _questionDeleterDomainService.DeleteAsync(notification.Question.Id, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
