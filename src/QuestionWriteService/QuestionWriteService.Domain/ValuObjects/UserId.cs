namespace QuestionWriteService.Domain.ValuObjects
{
    public class UserId
    {
        public int Id { get; private set; }

        public UserId(int id)
        {
            ArgumentNullException.ThrowIfNull(id);
            Id = id;
        }

        public static bool operator ==(UserId left, UserId right) => left.Id == right.Id;
        public static bool operator !=(UserId left, UserId right) => left.Id != right.Id;

        public override bool Equals(object? obj)
        {
            if (ReferenceEquals(this, obj)) return true;
            if (obj is null || obj is not UserId) return false;
            return (obj as UserId)!.Id == Id;
        }

        public override int GetHashCode() => Id.GetHashCode();
    }
}
