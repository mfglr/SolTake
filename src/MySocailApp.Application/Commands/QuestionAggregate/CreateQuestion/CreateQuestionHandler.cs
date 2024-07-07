using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.PostAggregate;
using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion
{
    public class CreateQuestionHandler(QuestionCreator questionCreator, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IQuestionWriteRepository repository) : IRequestHandler<CreateQuestionDto, CreateQuestionResponseDto>
    {
        private readonly QuestionCreator _questionCreator = questionCreator;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IQuestionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        public async Task<CreateQuestionResponseDto> Handle(CreateQuestionDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var streams = request.Images.Select(x => x.OpenReadStream());

            var question = new Question();
            await _questionCreator.CreateAsync(question, accountId, request.Content, request.Exam, request.Subject, request.TopicIds, streams, cancellationToken);
            await _repository.CreateAsync(question, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new(question.Id);
        }
    }
}
