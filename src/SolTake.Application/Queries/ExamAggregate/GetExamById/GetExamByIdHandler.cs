using MediatR;
using SolTake.Application.QueryRepositories;
using SolTake.Domain.ExamAggregate.Exceptions;

namespace SolTake.Application.Queries.ExamAggregate.GetExamById
{
    public class GetExamByIdHandler(IExamQueryRepository examQueryRepository) : IRequestHandler<GetExamByIdDto, ExamResponseDto>
    {
        private readonly IExamQueryRepository _examQueryRepository = examQueryRepository;

        public async Task<ExamResponseDto> Handle(GetExamByIdDto request, CancellationToken cancellationToken)
            => 
                (await _examQueryRepository.GetExamByIdAsync(request.ExamId, cancellationToken)) ??
                throw new ExamNotFoundException();
    }
}
