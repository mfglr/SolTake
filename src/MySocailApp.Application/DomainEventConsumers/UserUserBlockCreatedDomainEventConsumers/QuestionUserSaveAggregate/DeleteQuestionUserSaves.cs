using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.QuestionUserSaveAggregate
{
    public class DeleteQuestionUserSaves(IQuestionUserSaveWriteRepository questionUserSaveWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly IQuestionUserSaveWriteRepository _questionUserSaveWriteRepository = questionUserSaveWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var userIds = new List<int> { notification.UserUserBlock.BlockerId, notification.UserUserBlock.BlockedId };
            var questionUserSaves = await _questionUserSaveWriteRepository.GetByUserIds(userIds, cancellationToken);
            _questionUserSaveWriteRepository.DeleteRange(questionUserSaves);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
