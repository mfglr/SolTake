using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.Get
{
    public record GetQuestionsByUserIdDto(int UserId, int? LastValue, int? Take) : IRequest<List<QuestionResponseDto>>;
}
