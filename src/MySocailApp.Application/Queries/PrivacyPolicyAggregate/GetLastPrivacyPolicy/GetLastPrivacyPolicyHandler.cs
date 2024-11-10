using MediatR;
using MySocailApp.Application.Extentions;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Domain.PrivacyPolicyAggregate.Interfaces;

namespace MySocailApp.Application.Queries.PrivacyPolicyAggregate.GetLastPrivacyPolicy
{
    public class GetLastPrivacyPolicyHandler(IBlobService blobService, IPrivacyPolicyReadRepository privacyPolicyReadRepository) : IRequestHandler<GetLastPrivacyPolicyDto, Stream>
    {
        private readonly IBlobService _blobServicee = blobService;
        private readonly IPrivacyPolicyReadRepository _privacyPolicyReadRepository = privacyPolicyReadRepository;

        public async Task<Stream> Handle(GetLastPrivacyPolicyDto request, CancellationToken cancellationToken)
        {
            var language = Languages.GetLanguage(request.Language);
            var policy = await _privacyPolicyReadRepository.GetLastPolicyAsync(cancellationToken);
            string blobName;
            if (language == Languages.TR)
                blobName = policy.BlobNameTr;
            else
                blobName = policy.BlobNameEn;
            return await _blobServicee.ReadAsync(ContainerName.PrivacyPolicies, blobName, cancellationToken);
        }
    }
}
