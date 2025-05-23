using MediatR;

namespace SolTake.Application.Queries.AppVersionAggregate.GetLatestVersion
{
    public class GetLatestVersionDto : IRequest<AppVersionResponseDto>;
}
