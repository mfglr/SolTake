using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.QuestionAggregate.DomainEvents;
using SolTake.Domain.QuestionAggregate.Exceptions;

namespace SolTake.Application.Commands.QuestionDomain.QuestionAggregate.DeleteQuestionByAdmin
{
    internal class DeleteQuestionByAdminHandler(IQuestionWriteRepository questionWriteRepository, IPublisher publisher, IUnitOfWork unitOfWork) : IRequestHandler<DeleteQuestionByAdminDto>
    {
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly IPublisher _publisher = publisher;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DeleteQuestionByAdminDto request, CancellationToken cancellationToken)
        {
            var question = 
                await _questionWriteRepository.GetQuestionAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();
            _questionWriteRepository.Delete(question);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new QuestionDeletedDomainEvent(question), cancellationToken);
        }
    }
}
