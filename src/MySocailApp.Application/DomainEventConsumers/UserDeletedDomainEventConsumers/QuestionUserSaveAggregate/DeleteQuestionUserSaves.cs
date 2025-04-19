using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.QuestionUserSaveAggregate
{
    public class DeleteQuestionUserSaves(IUnitOfWork unitOfWork, IQuestionUserSaveWriteRepository questionUserSaveWriteRepository) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IQuestionUserSaveWriteRepository _questionUserSaveWriteRepository = questionUserSaveWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var saves = await _questionUserSaveWriteRepository.GetByUserId(notification.User.Id, cancellationToken);
            _questionUserSaveWriteRepository.DeleteRange(saves);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
