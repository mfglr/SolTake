namespace MySocailApp.Core.Exceptions
{
    public abstract class AppException(int statusCode) : Exception
    {
        public int StatusCode { get; private set; } = statusCode;
        public abstract string GetErrorMessage(string culture);
    }
}
