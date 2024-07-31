namespace MySocailApp.Core
{
    public interface IPaginableAggregateRoot : IAggregateRoot
    {
        int Id { get; }
    }
}
