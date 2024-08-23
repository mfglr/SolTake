using AutoMapper;
using MediatR;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetUnsolvedQuestionsByUserId
{
    public class GetUnsolvedQuestionsByUserIdHandler(IQuestionReadRepository questionReadRepository, IMapper mapper) : IRequestHandler<GetUnsolvedQuestionsByUserIdDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<QuestionResponseDto>> Handle(GetUnsolvedQuestionsByUserIdDto request, CancellationToken cancellationToken)
        {
            var questions = await _questionReadRepository.GetUnsolvedQuestionsByUserIdAsync(request.UserId,request,cancellationToken);
            return _mapper.Map<List<QuestionResponseDto>>(questions);
        }
    }
}
