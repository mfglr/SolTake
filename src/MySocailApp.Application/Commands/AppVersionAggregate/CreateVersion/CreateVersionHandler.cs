using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AppVersionAggregate.Abstracts;
using MySocailApp.Domain.AppVersionAggregate.DomainServices;
using MySocailApp.Domain.AppVersionAggregate.Entities;
using MySocailApp.Domain.AppVersionAggregate.ValuObjects;

namespace MySocailApp.Application.Commands.AppVersionAggregate.CreateVersion
{
    public class CreateVersionHandler(IAppVersionWriteRepository versionWriteRepository, IUnitOfWork unitOfWork, IAppVersionCacheService versionCacheService, AppVersionCreatorDomainService appVersionCreatorDomainService) : IRequestHandler<CreateVersionDto>
    {
        private readonly IAppVersionWriteRepository _versionWriteRepository = versionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAppVersionCacheService _versionCacheService = versionCacheService;
        private readonly AppVersionCreatorDomainService _appVersionCreatorDomainService = appVersionCreatorDomainService;

        public async Task Handle(CreateVersionDto request, CancellationToken cancellationToken)
        {
            //create version
            var versionCode = new VersionCode(request.Code);
            var appVersion = new AppVersion(versionCode, request.IsUpgradeRequired);
            _appVersionCreatorDomainService.Create(appVersion);
            await _versionWriteRepository.CreateAsync(appVersion, cancellationToken);

            //commit changes
            await _unitOfWork.CommitAsync(cancellationToken);

            //update app version cache service
            _versionCacheService.AddVersion(appVersion);
        }
    }
}
