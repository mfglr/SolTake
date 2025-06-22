using SolTake.Core;
using SolTake.Domain.QuestionUserComplaintAggregate.ValueObjects;

namespace SolTake.Application.Queries.QuestionUserComplaintAggregate
{
    public record QuestionUserComplaintResponseDto(int Id, DateTime CreatedAt, QuestionComplaintReason Reason,string? Content, IReadOnlyList<Multimedia> Medias, string? QuestionContent);
}
