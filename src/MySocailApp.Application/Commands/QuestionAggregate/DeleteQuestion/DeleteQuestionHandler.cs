using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.QuestionAggregate.DeleteQuestion
{
    public class DeleteQuestionHandler(IQuestionWriteRepository questionWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader) : IRequestHandler<DeleteQuestionDto>
    {
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;


        public async Task Handle(DeleteQuestionDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var question =
                await _questionWriteRepository.GetQuestionWithImagesAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (question.AppUserId != accountId)
                throw new PermissionDeniedToDeleteQuestionException();

            question.Remove();

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
