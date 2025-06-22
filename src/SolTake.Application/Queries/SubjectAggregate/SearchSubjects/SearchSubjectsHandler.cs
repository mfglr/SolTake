using MediatR;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.SubjectAggregate.SearchSubjects
{
    public class SearchSubjectsHandler(ISubjectQueryRepository subjectQueryRepository) : IRequestHandler<SearchSubjectsDto, List<SubjectResponseDto>>
    {
        private readonly ISubjectQueryRepository _subjectQueryRepository = subjectQueryRepository;

        public Task<List<SubjectResponseDto>> Handle(SearchSubjectsDto request, CancellationToken cancellationToken)
            => _subjectQueryRepository.SearchSubjectsAsync(request.Key, request, cancellationToken);
    }
}
