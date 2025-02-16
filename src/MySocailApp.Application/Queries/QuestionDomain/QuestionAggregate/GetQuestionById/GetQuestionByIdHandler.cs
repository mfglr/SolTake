using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Excpetions;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetQuestionById
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
