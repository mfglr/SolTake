using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionById
{
    public record GetQuestionByIdDto(int Id) : IRequest<QuestionResponseDto>;
}
