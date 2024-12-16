using MySocailApp.Domain.AccountDomain.AccountAggregate.DomainServices;

namespace MySocialApp.Domain.Tests.AccountAggregate
{
    public class HashComputerTests
    {

        [Fact]
        public void Test1()
        {
            var password = "123456";
            var result = HashComputer.Compute(password);

            Assert.True(HashComputer.Check(password, result));
        }

        [Fact]
        public void Test2()
        {
            var password = "123456";
            var result = HashComputer.Compute(password);

            Assert.False(HashComputer.Check("12345", result));
        }

    }
}
