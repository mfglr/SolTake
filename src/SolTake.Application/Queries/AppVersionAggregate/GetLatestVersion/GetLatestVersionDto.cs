using MediatR;
using MySocailApp.Application.Queries.AppVersionAggregate;

namespace MySocailApp.Application.Queries.AppVersionAggregate.GetLatestVersion
{
    public class GetLatestVersionDto : IRequest<AppVersionResponseDto>;
}
