using AutoMapper;
using MediatR;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetSolvedQuestionsByUserId
{
    public class GEtSolvedQuestionsByUserIdHandler(IQuestionReadRepository questionReadRepository, IMapper mapper) : IRequestHandler<GetSolvedQuestionsByUserIdDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<QuestionResponseDto>> Handle(GetSolvedQuestionsByUserIdDto request, CancellationToken cancellationToken)
        {
            var questions = await _questionReadRepository.GetSolvedQuestionsByUserIdAsync(request.UserId, request, cancellationToken);
            return _mapper.Map<List<QuestionResponseDto>>(questions);
        }
    }
}
