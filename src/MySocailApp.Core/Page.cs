namespace MySocailApp.Core
{
    public class Page(int offset, int take, bool isDescending) : IPage
    {
        public int Offset { get; private set; } = offset;
        public int Take { get; private set; } = take;
        public bool IsDescending { get; private set; } = isDescending;
    }
}
