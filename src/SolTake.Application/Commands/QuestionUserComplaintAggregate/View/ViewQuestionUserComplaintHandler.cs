using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.QuestionUserComplaintAggregate.Abstracts;
using SolTake.Domain.QuestionUserComplaintAggregate.Exceptions;

namespace SolTake.Application.Commands.QuestionUserComplaintAggregate.View
{
    internal class ViewQuestionUserComplaintHandler(IQuestionUserComplaintRepository questionUserComplaintRepository, IUnitOfWork unitOfWork) : IRequestHandler<ViewQuestionUserComplaintDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionUserComplaintRepository _questionUserComplaintRepository = questionUserComplaintRepository;

        public async Task Handle(ViewQuestionUserComplaintDto request, CancellationToken cancellationToken)
        {
            var complaint =
                await _questionUserComplaintRepository.GetByIdAsync(request.Id, cancellationToken) ??
                throw new QuestionUserComplaintNotFoundException();

            complaint.View();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
