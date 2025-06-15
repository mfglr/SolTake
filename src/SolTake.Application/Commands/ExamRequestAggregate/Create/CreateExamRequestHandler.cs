using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.ExamRequestAggregate.Abstracts;
using SolTake.Domain.ExamRequestAggregate.DomainEvents;
using SolTake.Domain.ExamRequestAggregate.Entities;
using SolTake.Domain.ExamRequestAggregate.ValueObjects;

namespace SolTake.Application.Commands.ExamRequestAggregate.Create
{
    public class CreateExamRequestHandler(IExamRequestRepository examRequestRepository, IUnitOfWork unitOfWork, IPublisher publisher, IAccessTokenReader accessTokenReader) : IRequestHandler<CreateExamRequestDto, CreateExamRequestResponseDto>
    {
        private readonly IExamRequestRepository _examRequestRepository = examRequestRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<CreateExamRequestResponseDto> Handle(CreateExamRequestDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var name = new ExamRequestName(request.Name);
            var initialism = new ExamRequestInitialism(request.Initialism);
            var examRequest = new ExamRequest(userId, name, initialism);
            examRequest.Create();
            await _examRequestRepository.CreateAsync(examRequest, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new ExamRequestCreatedDomainEvent(examRequest), cancellationToken);
            return new(examRequest.Id);
        }
    }
}
