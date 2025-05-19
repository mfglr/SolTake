namespace SolTake.Core
{
    public record Page(int? Offset, int Take, bool IsDescending) : IPage;
}
