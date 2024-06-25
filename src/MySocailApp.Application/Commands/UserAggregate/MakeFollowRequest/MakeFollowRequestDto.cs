using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.MakeFollowRequest
{
    public record MakeFollowRequestDto(string RequestedId) : IRequest;
}
