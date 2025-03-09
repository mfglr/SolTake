using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.GetUnsolvedQuestionsByUserId
{
    public class GetUnsolvedQuestionsByUserIdDto(int userId, int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<QuestionResponseDto>>
    {
        public int UserId { get; private set; } = userId;
    }
}
