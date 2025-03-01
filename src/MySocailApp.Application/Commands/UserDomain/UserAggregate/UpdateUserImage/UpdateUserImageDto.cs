using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Core;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateUserImage
{
    public record UpdateUserImageDto(IFormFile File) : IRequest<Multimedia>;
}
