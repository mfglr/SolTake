using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.ExamRequestAggregate.Abstracts;
using SolTake.Domain.ExamRequestAggregate.Exceptions;

namespace SolTake.Application.Commands.ExamRequestAggregate.Delete
{
    public class DeleteExamRequestHandler(IExamRequestRepository examRequestRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<DeleteExamRequestDto>
    {
        private readonly IExamRequestRepository _examRequestRepository = examRequestRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(DeleteExamRequestDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var examRequest =
                await _examRequestRepository.GetByIdAsync(request.Id, cancellationToken) ??
                throw new ExamRequestNotFoundException();

            if (examRequest.UserId != userId)
                throw new PermissionDeniedToDeleteExamRequestException();
            
            _examRequestRepository.Delete(examRequest);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
