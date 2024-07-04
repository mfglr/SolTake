using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.RejectFollowRequest
{
    public record RejectFollowRequestDto(string RequesterId) : IRequest;
}
