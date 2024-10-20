using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.QuestionAggregate.Excpetions;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionById
{
    public class GetQuestionByIdHandler(IQuestionQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetQuestionByIdDto, QuestionResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IQuestionQueryRepository _repository = repository;

        public async Task<QuestionResponseDto> Handle(GetQuestionByIdDto request, CancellationToken cancellationToken)
            => await _repository.GetQuestionByIdAsync(
                    request.Id,
                    _accessTokenReader.GetRequiredAccountId(),
                    cancellationToken
                ) ??
                throw new QuestionNotFoundException();
    }
}
