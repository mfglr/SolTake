using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.AcceptFollowRequest
{
    public record AcceptFollowRequestDto(string RequesterId) : IRequest;
}
