using MediatR;
using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateUserImage
{
    public record UpdateUserImageDto(IFormFile File) : IRequest<UpdateUserImageResponseDto>;
}
