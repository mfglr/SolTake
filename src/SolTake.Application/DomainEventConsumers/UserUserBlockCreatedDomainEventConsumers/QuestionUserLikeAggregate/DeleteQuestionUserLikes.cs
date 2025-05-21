using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.QuestionUserLikeAggregate.Abstracts;
using SolTake.Domain.UserUserBlockAggregate.DomainEvents;
using SolTake.Core;

namespace MySocailApp.Application.DomainEventConsumers.UserUserBlockCreatedDomainEventConsumers.QuestionUserLikeAggregate
{
    public class DeleteQuestionUserLikes(IQuestionUserLikeWriteRepository questionUserLikeWriteRepository, IUnitOfWork unitOfWork, IQuestionReadRepository questionReadRepository) : IDomainEventConsumer<UserUserBlockCreatedDomainEvent>
    {
        private readonly IQuestionUserLikeWriteRepository _questionUserLikeWriteRepository = questionUserLikeWriteRepository;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserUserBlockCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var questionIdsOfBlocker = await _questionReadRepository.GetQuestionIdsOfUser(notification.UserUserBlock.BlockerId, cancellationToken);
            var questionUserLikes0 = await _questionUserLikeWriteRepository.GetAsync(questionIdsOfBlocker, notification.UserUserBlock.BlockedId,cancellationToken);
            _questionUserLikeWriteRepository.DeleteRange(questionUserLikes0);

            var questionIdsOfBlocked = await _questionReadRepository.GetQuestionIdsOfUser(notification.UserUserBlock.BlockedId, cancellationToken);
            var questionUserLikes1 = await _questionUserLikeWriteRepository.GetAsync(questionIdsOfBlocked, notification.UserUserBlock.BlockerId, cancellationToken);
            _questionUserLikeWriteRepository.DeleteRange(questionUserLikes1);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
