using MediatR;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.ExamAggregate.GetExams
{
    public class GetExamsHandler(IExamQueryRepository examQueryRepository) : IRequestHandler<GetExamsDto, List<ExamResponseDto>>
    {
        private readonly IExamQueryRepository _examQueryRepository = examQueryRepository;

        public Task<List<ExamResponseDto>> Handle(GetExamsDto request, CancellationToken cancellationToken)
            => _examQueryRepository.GetAllAsync(cancellationToken);
    }
}
