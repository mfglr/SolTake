using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.ExamRequestAggregate.Abstracts;
using SolTake.Domain.ExamRequestAggregate.DomainEvents;
using SolTake.Domain.ExamRequestAggregate.Exceptions;

namespace SolTake.Application.Commands.ExamRequestAggregate.Reject
{
    public class RejectExamRequestHandler(IExamRequestRepository examRequestRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IRequestHandler<RejectExamRequestDto>
    {
        private readonly IExamRequestRepository _examRequestRepository = examRequestRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(RejectExamRequestDto request, CancellationToken cancellationToken)
        {
            var examRequest =
                await _examRequestRepository.GetByIdAsync(request.Id, cancellationToken) ??
                throw new ExamRequestNotFoundException();
            examRequest.Reject(request.Reason);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new ExamRequestRejectedDomainEvent(examRequest),cancellationToken);
        }
    }
}
