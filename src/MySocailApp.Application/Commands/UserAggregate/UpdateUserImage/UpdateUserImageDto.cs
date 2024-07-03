using MediatR;
using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateUserImage
{
    public record UpdateUserImageDto(IFormFile file) : IRequest;
}
