using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.DomainEvents;
using MySocailApp.Domain.QuestionAggregate.Abstracts;

namespace MySocailApp.Application.DomainEventConsumers.UserDeletedDomainEventConsumers.QuestionAggregate
{
    public class DeleteQuestionUserLikes(IQuestionWriteRepository questionWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<UserDeletedDomainEvent>
    {
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UserDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            await _questionWriteRepository.DeleteQuestionUserLikesByUserId(notification.User.Id, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
