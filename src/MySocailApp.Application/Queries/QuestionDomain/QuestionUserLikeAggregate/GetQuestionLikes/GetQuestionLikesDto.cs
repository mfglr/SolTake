using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionUserLikeAggregate.GetQuestionLikes
{
    public class GetQuestionLikesDto(int questionId, int offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<QuestionUserLikeResponseDto>>
    {
        public int QuestionId { get; private set; } = questionId;
    }
}
