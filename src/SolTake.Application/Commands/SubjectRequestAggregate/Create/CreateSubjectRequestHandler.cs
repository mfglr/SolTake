using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.ExamAggregate.Exceptions;
using SolTake.Domain.ExamAggregate.Interfaces;
using SolTake.Domain.SubjectRequestAggregate.Abstracts;
using SolTake.Domain.SubjectRequestAggregate.DomainEvents;
using SolTake.Domain.SubjectRequestAggregate.Entities;
using SolTake.Domain.SubjectRequestAggregate.ValueObjects;

namespace SolTake.Application.Commands.SubjectRequestAggregate.Create
{
    public class CreateSubjectRequestHandler(IUnitOfWork unitOfWork, ISubjectRequestRepository subjectRequestRepository, IPublisher publisher, IAccessTokenReader accessTokenReader, IExamReadRepository examReadRepository) : IRequestHandler<CreateSubjectRequestDto, CreateSubjectRequestResponseDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ISubjectRequestRepository _subjectRequestRepository = subjectRequestRepository;
        private readonly IPublisher _publisher = publisher;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IExamReadRepository _examReadRepository = examReadRepository;

        public async Task<CreateSubjectRequestResponseDto> Handle(CreateSubjectRequestDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            if (!await _examReadRepository.ExistAsync(request.ExamId, cancellationToken))
                throw new ExamNotFoundException();
            var subjectName = new SubjectName(request.Name);
            var subjectRequest = new SubjectRequest(userId, request.ExamId, subjectName);
            subjectRequest.Create();
            await _subjectRequestRepository.CreateAsync(subjectRequest, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new SubjectRequestCreatedDomainEvent(subjectRequest), cancellationToken);
            return new(subjectRequest.Id);
        }
    }
}
