namespace SolTake.Core
{
    public record MediasDeletedDomainEvent(IEnumerable<Multimedia> Medias) : IDomainEvent;
}
