using MySocailApp.Domain.AppVersionAggregate.Exceptions;
using MySocailApp.Domain.AppVersionAggregate.ValuObjects;

namespace MySocialApp.Domain.Tests.AppVersionAggregate
{
    public class VersionCodeTests
    {

        [Fact]
        public void Test()
        {
            new VersionCode("1.0.0");
        }
    }
}
