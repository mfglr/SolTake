using AutoMapper;
using MediatR;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Domain.QuestionAggregate.Excpetions;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionById
{
    public class GetQuestionByIdHandler(IQuestionReadRepository repository, IMapper mapper) : IRequestHandler<GetQuestionByIdDto, QuestionResponseDto>
    {
        private readonly IQuestionReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task<QuestionResponseDto> Handle(GetQuestionByIdDto request, CancellationToken cancellationToken)
        {
            var question = 
                await _repository.GetByIdAsync(request.Id, cancellationToken) ?? 
                throw new QuestionIsNotFoundException();
            return _mapper.Map<QuestionResponseDto>(question);
        }
    }
}
