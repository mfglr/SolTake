using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.Services
{
    public class DomainEventsPublisher(IPublisher publisher, AppDbContext context) : IDomainEventsPublisher
    {
        private readonly IPublisher _publisher = publisher;
        private readonly AppDbContext _context = context;

        public async Task PublishDomainEvents(CancellationToken cancellationToken)
        {
            var containers = _context
                .ChangeTracker
                .Entries<IDomainEventsContainer>()
                .Where(x => x.Entity.Events.Any())
                .Select(x => x.Entity)
                .ToList();

            foreach (var continer in containers)
                foreach (var @event in continer.Events)
                    await _publisher.Publish(@event,cancellationToken);
        }
    }
}
