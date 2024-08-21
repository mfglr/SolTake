using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetUnsolvedQuestionsByUserId
{
    public record GetUnsolvedQuestionsByUserIdDto(int UserId,int? Offset,int Take,bool IsDescending) : IRequest<List<QuestionResponseDto>>;
}
