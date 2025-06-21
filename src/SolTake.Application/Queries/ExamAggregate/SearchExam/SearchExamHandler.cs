using MediatR;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.ExamAggregate.SearchExam
{
    public class SearchExamHandler(IExamQueryRepository examQueryRepository) : IRequestHandler<SearchExamDto, List<ExamResponseDto>>
    {
        private readonly IExamQueryRepository _examQueryRepository = examQueryRepository;

        public Task<List<ExamResponseDto>> Handle(SearchExamDto request, CancellationToken cancellationToken)
            => _examQueryRepository.SearchAsync(request.Key, request, cancellationToken);
    }
}
