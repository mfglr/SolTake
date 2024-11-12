using MediatR;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.VersionAggregate.GetLatestVersion
{
    public class GetLatestVersionHandler(IVersionQueryRepository versionQueryRepository) : IRequestHandler<GetLatestVersionDto, VersionResponseDto>
    {
        private readonly IVersionQueryRepository _versionQueryRepository = versionQueryRepository;

        public Task<VersionResponseDto> Handle(GetLatestVersionDto request, CancellationToken cancellationToken)
            => _versionQueryRepository.GetLatestVersionAsync(cancellationToken);
    }
}
