using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.VersionAggregate.Abstracts;

namespace MySocailApp.Application.Commands.VersionAggregate.CreateVersion
{
    public class CreateVersionHandler(IVersionWriteRepository versionWriteRepository, IUnitOfWork unitOfWork, IVersionCacheService versionCacheService) : IRequestHandler<CreateVersionDto>
    {
        private readonly IVersionWriteRepository _versionWriteRepository = versionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IVersionCacheService _versionCacheService = versionCacheService;

        public async Task Handle(CreateVersionDto request, CancellationToken cancellationToken)
        {
            var version = Domain.VersionAggregate.Entities.Version.Create(request.Code, request.IsUpgradeRequired);
            await _versionWriteRepository.CreateAsync(version, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            _versionCacheService.AddVersion(version);
        }
    }
}
