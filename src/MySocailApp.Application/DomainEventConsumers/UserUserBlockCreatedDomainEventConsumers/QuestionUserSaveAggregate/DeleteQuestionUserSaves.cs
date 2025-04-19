using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.QuestionUserSaveAggregate
{
    public class DeleteQuestionUserSaves(IQuestionUserSaveWriteRepository questionUserSaveWriteRepository, IUnitOfWork unitOfWork, IQuestionReadRepository questionReadRepository) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly IQuestionUserSaveWriteRepository _questionUserSaveWriteRepository = questionUserSaveWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var questionIdsOfBlocker = await _questionReadRepository.GetQuestionIdsOfUser(notification.UserUserBlock.BlockerId, cancellationToken);
            var questionUserLikes0 = await _questionUserSaveWriteRepository.GetAsync(questionIdsOfBlocker, notification.UserUserBlock.BlockedId, cancellationToken);
            _questionUserSaveWriteRepository.DeleteRange(questionUserLikes0);

            var questionIdsOfBlocked = await _questionReadRepository.GetQuestionIdsOfUser(notification.UserUserBlock.BlockedId, cancellationToken);
            var questionUserLikes1 = await _questionUserSaveWriteRepository.GetAsync(questionIdsOfBlocked, notification.UserUserBlock.BlockerId, cancellationToken);
            _questionUserSaveWriteRepository.DeleteRange(questionUserLikes1);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
