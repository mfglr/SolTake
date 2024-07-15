using AutoMapper;
using MediatR;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Services;
using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion
{
    public class CreateQuestionHandler(QuestionManager manager, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IQuestionWriteRepository repository,IMapper mapper) : IRequestHandler<CreateQuestionDto, QuestionResponseDto>
    {
        private readonly QuestionManager _manager = manager;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IQuestionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMapper _mapper = mapper;

        public async Task<QuestionResponseDto> Handle(CreateQuestionDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var streams = request.Images.Select(x => x.OpenReadStream());

            var question = new Question();
            await _manager.CreateAsync(question,accountId,request.Content,request.ExamId,request.SubjectId, request.TopicIds, streams, cancellationToken);
            await _repository.CreateAsync(question, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return _mapper.Map<QuestionResponseDto>(question);
        }
    }
}
