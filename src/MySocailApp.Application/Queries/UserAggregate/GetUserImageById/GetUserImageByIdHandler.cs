using MediatR;
using MySocailApp.Application.Extentions;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserImageById
{
    public class GetUserImageByIdHandler(IAppUserReadRepository repository, UserImageReader userImageReader) : IRequestHandler<GetUserImageById, byte[]>
    {
        private readonly IAppUserReadRepository _repository = repository;
        private readonly UserImageReader _userImageReader = userImageReader;

        public async Task<byte[]> Handle(GetUserImageById request, CancellationToken cancellationToken)
        {
            var user = 
                await _repository.GetByIdAsync(request.UserId, cancellationToken) ?? 
                throw new UserIsNotFoundException();
            using var stream = _userImageReader.Read(user);
            return await stream.ToByteArrayAsync();
        }
    }
}
