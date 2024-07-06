using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.CancelFollowRequest
{
    public record CancelFollowRequestDto(string RequesterId) : IRequest;
}
