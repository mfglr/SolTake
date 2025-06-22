using MediatR;
using SolTake.Domain.QuestionUserComplaintAggregate.ValueObjects;

namespace SolTake.Application.Commands.QuestionUserComplaintAggregate.Create
{
    public record CreateQuestionUserComplaintDto(int QuestionId, QuestionComplaintReason Reason, string? Content) : IRequest;
}
