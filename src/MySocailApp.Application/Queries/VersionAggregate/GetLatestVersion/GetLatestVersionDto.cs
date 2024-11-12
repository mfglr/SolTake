using MediatR;

namespace MySocailApp.Application.Queries.VersionAggregate.GetLatestVersion
{
    public class GetLatestVersionDto : IRequest<VersionResponseDto>;
}
