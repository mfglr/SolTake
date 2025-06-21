using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.SubjectRequestAggregate.Abstracts;
using SolTake.Domain.SubjectRequestAggregate.Exceptions;

namespace SolTake.Application.Commands.SubjectRequestAggregate.Delete
{
    internal class DeleteSubjectRequestHandler(ISubjectRequestRepository subjectRequestRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<DeleteSubjectRequestDto>
    {
        private readonly ISubjectRequestRepository _subjectRequestRepository = subjectRequestRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(DeleteSubjectRequestDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var subjectReques = 
                await _subjectRequestRepository.GetByIdAsync(request.Id, cancellationToken) ??
                throw new SubjectRequestNotFoundException();
            if (userId != subjectReques.UserId)
                throw new PermissionDeniedToDeleteSubjectRequestException();
            _subjectRequestRepository.Delete(subjectReques);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
