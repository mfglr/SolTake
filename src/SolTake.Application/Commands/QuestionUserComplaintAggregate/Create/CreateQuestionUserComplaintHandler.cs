using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.CommentAggregate.Exceptions;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.QuestionUserComplaintAggregate.Abstracts;
using SolTake.Domain.QuestionUserComplaintAggregate.Entities;
using SolTake.Domain.QuestionUserComplaintAggregate.Exceptions;
using SolTake.Domain.QuestionUserComplaintAggregate.ValueObjects;

namespace SolTake.Application.Commands.QuestionUserComplaintAggregate.Create
{
    internal class CreateQuestionUserComplaintHandler(IUnitOfWork unitOfWork, IQuestionUserComplaintRepository questionUserComplaintRepository, IAccessTokenReader accessTokenReader, IQuestionReadRepository questionReadRepository) : IRequestHandler<CreateQuestionUserComplaintDto, CreateQuestionUserComplaintResponseDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IQuestionUserComplaintRepository _questionUserComplaintRepository = questionUserComplaintRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<CreateQuestionUserComplaintResponseDto> Handle(CreateQuestionUserComplaintDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            
            var question = 
                await _questionReadRepository.GetAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();
            
            if (question.UserId == userId)
                throw new SelfReportNotAllowedException();

            var content = request.Content != null ? new QuestionComplaintContent(request.Content) : null;
            var complaint = new QuestionUserComplaint(request.QuestionId, userId, request.Reason, content);
            complaint.Create();
            await _questionUserComplaintRepository.CreateAsync(complaint, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new(complaint.Id);
        }
    }
}
