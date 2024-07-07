using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.MakeFollowRequest
{
    public record MakeFollowRequestDto(int RequestedId) : IRequest;
}
