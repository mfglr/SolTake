using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionUserSaveAggregate.GetQuestionUserSaves
{
    public class GetQuestionUserSavesHandler(IQuestionUserSaveQueryRepository questionUserSaveQueryRepository, IUserAccessor userAccessor) : IRequestHandler<GetQuestionUserSavesDto, List<QuestionUserSaveResponseDto>>
    {
        private readonly IQuestionUserSaveQueryRepository _questionUserSaveQueryRepository = questionUserSaveQueryRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public Task<List<QuestionUserSaveResponseDto>> Handle(GetQuestionUserSavesDto request, CancellationToken cancellationToken)
            => _questionUserSaveQueryRepository
                .GetAsync(
                    _userAccessor.User.Id,
                    _userAccessor.User.Id,
                    request,
                    cancellationToken
                );
    }
}
