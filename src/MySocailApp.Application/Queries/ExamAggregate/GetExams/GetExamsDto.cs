using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.ExamAggregate.GetExams
{
    public class GetExamsDto(int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<ExamResponseDto>>;
}
