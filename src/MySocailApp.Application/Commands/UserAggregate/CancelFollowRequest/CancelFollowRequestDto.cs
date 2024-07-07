using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.CancelFollowRequest
{
    public record CancelFollowRequestDto(int RequesterId) : IRequest;
}
