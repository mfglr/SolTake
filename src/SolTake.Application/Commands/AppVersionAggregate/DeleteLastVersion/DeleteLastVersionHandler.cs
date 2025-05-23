using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.AppVersionAggregate.Abstracts;

namespace SolTake.Application.Commands.AppVersionAggregate.DeleteLastVersion
{
    public class DeleteLastVersionHandler(IAppVersionWriteRepository versionWriteRepository, IUnitOfWork unitOfWork, IAppVersionCacheService versionCacheService) : IRequestHandler<DeleteLastVersionDto>
    {
        private readonly IAppVersionWriteRepository _versionWriteRepository = versionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAppVersionCacheService _versionCacheService = versionCacheService;

        public async Task Handle(DeleteLastVersionDto request, CancellationToken cancellationToken)
        {
            var version = await _versionWriteRepository.GetLastVersionAsync(cancellationToken);
            _versionWriteRepository.Delete(version);
            await _unitOfWork.CommitAsync(cancellationToken);

            _versionCacheService.RemoveLastVersion();
        }
    }
}
