using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.VersionAggregate.Abstracts;

namespace MySocailApp.Application.Commands.VersionAggregate.DeleteLastVersion
{
    public class DeleteLastVersionHandler(IVersionWriteRepository versionWriteRepository, IUnitOfWork unitOfWork, IVersionCacheService versionCacheService) : IRequestHandler<DeleteLastVersionDto>
    {
        private readonly IVersionWriteRepository _versionWriteRepository = versionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IVersionCacheService _versionCacheService = versionCacheService;

        public async Task Handle(DeleteLastVersionDto request, CancellationToken cancellationToken)
        {
            var version = await _versionWriteRepository.GetLastVersionAsync(cancellationToken);
            _versionWriteRepository.Delete(version);
            await _unitOfWork.CommitAsync(cancellationToken);

            _versionCacheService.RemoveLastVersion();
        }
    }
}
