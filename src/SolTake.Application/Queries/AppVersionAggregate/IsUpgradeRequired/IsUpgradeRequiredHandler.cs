using MediatR;
using SolTake.Domain.AppVersionAggregate.Abstracts;

namespace SolTake.Application.Queries.AppVersionAggregate.IsUpgradeRequired
{
    public class IsUpgradeRequiredHandler(IAppVersionReadRepository appVersionReadRepository) : IRequestHandler<IsUpgradeRequiredDto, bool>
    {
        private readonly IAppVersionReadRepository _appVersionReadRepository = appVersionReadRepository;

        public Task<bool> Handle(IsUpgradeRequiredDto request, CancellationToken cancellationToken)
            => _appVersionReadRepository.IsUpgradeRequiredAsync(new(request.Code), cancellationToken);
    }
}
