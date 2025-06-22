using MediatR;

namespace SolTake.Application.Commands.QuestionUserComplaintAggregate.View
{
    public record ViewQuestionUserComplaintDto(int Id) : IRequest;
}
