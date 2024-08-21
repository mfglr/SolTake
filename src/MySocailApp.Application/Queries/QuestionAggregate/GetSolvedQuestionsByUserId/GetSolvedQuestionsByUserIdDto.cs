using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetSolvedQuestionsByUserId
{
    public record GetSolvedQuestionsByUserIdDto(int UserId, int? Offset, int Take, bool IsDescending) : IRequest<List<QuestionResponseDto>>;
}
