using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;
using SolTake.Domain.QuestionAggregate.Exceptions;

namespace SolTake.Application.Queries.QuestionDomain.GetQuestionById
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
