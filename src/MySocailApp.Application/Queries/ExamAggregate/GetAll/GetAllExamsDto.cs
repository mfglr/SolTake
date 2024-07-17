using MediatR;

namespace MySocailApp.Application.Queries.ExamAggregate.GetAll
{
    public record GetAllExamsDto : IRequest<List<ExamResponseDto>>;
}
