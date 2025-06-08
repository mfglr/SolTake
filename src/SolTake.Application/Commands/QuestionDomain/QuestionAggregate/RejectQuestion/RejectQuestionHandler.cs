using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.QuestionAggregate.DomainEvents;
using SolTake.Domain.QuestionAggregate.Exceptions;

namespace SolTake.Application.Commands.QuestionDomain.QuestionAggregate.RejectQuestion
{
    public class RejectQuestionHandler(IQuestionWriteRepository questionWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IRequestHandler<RejectQuestionDto>
    {
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(RejectQuestionDto request, CancellationToken cancellationToken)
        {
            var question =
                await _questionWriteRepository.GetQuestionAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();
            question.Reject();
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new QuestionRejectedDoaminEvent(question), cancellationToken);
        }
    }
}
