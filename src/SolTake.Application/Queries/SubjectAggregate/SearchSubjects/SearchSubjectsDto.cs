using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.SubjectAggregate.SearchSubjects
{
    public record SearchSubjectsDto(string? Key, int? Offset, int Take, bool IsDescending) : Page(Offset,Take,IsDescending), IRequest<List<SubjectResponseDto>>;
}
