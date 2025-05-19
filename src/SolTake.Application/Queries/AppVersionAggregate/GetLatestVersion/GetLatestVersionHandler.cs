using AutoMapper;
using MediatR;
using SolTake.Domain.AppVersionAggregate.Abstracts;

namespace MySocailApp.Application.Queries.AppVersionAggregate.GetLatestVersion
{
    public class GetLatestVersionHandler(IAppVersionCacheService appVersionCacheService, IMapper mapper) : IRequestHandler<GetLatestVersionDto, AppVersionResponseDto>
    {
        private readonly IAppVersionCacheService _appVersionCacheService = appVersionCacheService;
        private readonly IMapper _mapper = mapper;

        public Task<AppVersionResponseDto> Handle(GetLatestVersionDto request, CancellationToken cancellationToken)
            => Task.FromResult(_mapper.Map<AppVersionResponseDto>(_appVersionCacheService.Version));
    }
}
