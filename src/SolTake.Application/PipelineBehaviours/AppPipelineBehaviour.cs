using MediatR;
using SolTake.Application.InfrastructureServices;

namespace SolTake.Application.PipelineBehaviours
{
    public class AppPipelineBehaviour<TRequest, TResponse>(IDomainEventsPublisher publisher) : IPipelineBehavior<TRequest, TResponse>
        where TRequest : notnull
    {
        private readonly IDomainEventsPublisher _publisher = publisher;
        public async Task<TResponse> Handle(TRequest request, RequestHandlerDelegate<TResponse> next, CancellationToken cancellationToken)
        {
            var response = await next(cancellationToken);
            await _publisher.PublishDomainEvents(cancellationToken);
            return response;
        }
    }
}
