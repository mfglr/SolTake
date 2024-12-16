using MySocailApp.Domain.AccountDomain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.ValueObjects
{
    public class Password
    {
        public string Value { get; private set; } // not mapped
        public byte[] Hash { get; private set; }

        private Password() { }

        public Password(string value)
        {
            if (value == null || value.Length < 6)
                throw new InvalidPasswordException();
            Value = value;
            Hash = HashComputer.Compute(value);
        }

        public bool CompareValue(Password other) => Value == other.Value;
    }
}
