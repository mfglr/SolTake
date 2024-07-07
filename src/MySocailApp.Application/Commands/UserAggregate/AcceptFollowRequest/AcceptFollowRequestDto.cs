using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.AcceptFollowRequest
{
    public record AcceptFollowRequestDto(int RequesterId) : IRequest;
}
