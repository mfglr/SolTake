namespace SolTake.Core.Exceptions
{
    public abstract class AppException(int statusCode, string? message = null) : Exception(message)
    {
        public int StatusCode { get; private set; } = statusCode;
        public abstract string GetErrorMessage(string culture);
    }
}
