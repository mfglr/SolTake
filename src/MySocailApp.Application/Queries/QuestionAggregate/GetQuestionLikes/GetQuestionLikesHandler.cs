using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.QueryRepositories;
using MySocailApp.Application.Queries.UserAggregate;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionLikes
{
    public class GetQuestionLikesHandler(IAppUserQueryRepository queryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetQuestionLikesDto, List<AppUserResponseDto>>
    {
        private readonly IAppUserQueryRepository _queryRepository = queryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<List<AppUserResponseDto>> Handle(GetQuestionLikesDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            return await _queryRepository.GetLikesByQuestionIdAsync(request.QuestionId,accountId,request,cancellationToken);
        }
    }
}
