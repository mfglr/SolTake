namespace MySocailApp.Core
{
    public interface IRemovable
    {
        bool IsRemoved { get; }
        DateTime? RemovedAt { get; }
        void Remove();
        void Restore();
    }
}
