using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.UserAggregate.UserDeletedDomainEventConsumers
{
    public class DeleteQuestionUserSaves(IQuestionWriteRepository questionWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var questions = await _questionWriteRepository.GetQuestionsSavedByUserId(notification.User.Id, cancellationToken);
            foreach (var question in questions)
                question.DeleteSave(notification.User.Id);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
