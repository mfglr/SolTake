using MediatR;
using MySocailApp.Application.Extentions;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserImage
{
    public class GetUserImageHandler(IAccessTokenReader accessTokenReader, IAppUserReadRepository repository, UserImageReader reader) : IRequestHandler<GetUserImageDto, byte[]>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserReadRepository _repository = repository;
        private readonly UserImageReader _reader = reader;

        public async Task<byte[]> Handle(GetUserImageDto request, CancellationToken cancellationToken)
        {
            var id = _accessTokenReader.GetRequiredAccountId();
            var user = await _repository.GetByIdAsync(id, cancellationToken);
            using var stream = _reader.Read(user!);
            return await stream.ToByteArrayAsync(); 
        }
    }
}
