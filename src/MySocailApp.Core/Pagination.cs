namespace MySocailApp.Core
{
    public record Pagination(int Offset,int Take,bool IsDescending) : IPagination;
}
