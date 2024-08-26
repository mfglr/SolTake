using MediatR;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionLikes
{
    public class GetQuestionLikesDto(int questionId,int? offset,int take,bool isDescending) : Pagination(offset,take,isDescending), IRequest<List<AppUserResponseDto>>
    {
        public int QuestionId { get; private set; } = questionId;
    }
}
