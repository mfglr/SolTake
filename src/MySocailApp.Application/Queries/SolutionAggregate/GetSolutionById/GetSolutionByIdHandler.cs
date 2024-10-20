using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionById
{
    public class GetSolutionByIdHandler(ISolutionQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetSolutionByIdDto, SolutionResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionQueryRepository _repository = repository;

        public async Task<SolutionResponseDto> Handle(GetSolutionByIdDto request, CancellationToken cancellationToken)
            => await _repository
                .GetByIdAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request.SolutionId,
                    cancellationToken
                ) ??
                throw new SolutionNotFoundException();
    }
}
