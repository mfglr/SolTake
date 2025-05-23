using MediatR;
using SolTake.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.SubjectAggregate.GetByExamId
{
    public class GetSubjectsByExamIdHandler(ISubjectQueryRepository repository) : IRequestHandler<GetSubjectsByExamIdDto, List<SubjectResponseDto>>
    {
        private readonly ISubjectQueryRepository _repository = repository;

        public Task<List<SubjectResponseDto>> Handle(GetSubjectsByExamIdDto request, CancellationToken cancellationToken)
            => _repository.GetExamSubjectsAsync(request.ExamId, request, cancellationToken);
    }
}
