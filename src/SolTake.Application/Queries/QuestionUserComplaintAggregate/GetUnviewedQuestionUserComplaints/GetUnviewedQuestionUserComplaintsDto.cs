using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionUserComplaintAggregate.GetUnviewedQuestionUserComplaints
{
    public record GetUnviewedQuestionUserComplaintsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionUserComplaintResponseDto>>;
}
