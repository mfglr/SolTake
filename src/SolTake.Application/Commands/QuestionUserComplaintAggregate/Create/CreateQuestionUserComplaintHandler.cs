using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.QuestionUserComplaintAggregate.Abstracts;
using SolTake.Domain.QuestionUserComplaintAggregate.Entities;
using SolTake.Domain.QuestionUserComplaintAggregate.ValueObjects;

namespace SolTake.Application.Commands.QuestionUserComplaintAggregate.Create
{
    internal class CreateQuestionUserComplaintHandler(IUnitOfWork unitOfWork, IQuestionUserComplaintRepository questionUserComplaintRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<CreateQuestionUserComplaintDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionUserComplaintRepository _questionUserComplaintRepository = questionUserComplaintRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(CreateQuestionUserComplaintDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var content = request.Content != null ? new QuestionComplaintContent(request.Content) : null;
            var complaint = new QuestionUserComplaint(request.QuestionId, userId, request.Reason, content);
            complaint.Create();
            await _questionUserComplaintRepository.CreateAsync(complaint, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
