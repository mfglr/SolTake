using MediatR;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetSolvedQuestionsByUserId
{
    public class GetSolvedQuestionsByUserIdDto(int userId, int offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<QuestionResponseDto>>
    {
        public int UserId { get; private set; } = userId;
    }
}
