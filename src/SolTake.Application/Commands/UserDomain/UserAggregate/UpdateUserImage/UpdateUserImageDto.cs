using MediatR;
using Microsoft.AspNetCore.Http;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.UpdateUserImage
{
    public record UpdateUserImageDto(IFormFile File) : IRequest<UpdateUserImageResponseDto>;
}
