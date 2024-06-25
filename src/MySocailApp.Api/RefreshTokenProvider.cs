using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;


namespace MySocailApp.Infrastructure.TokenProviders
{
    public class RefreshTokenProvider<TUser>(IDataProtectionProvider dataProtectionProvider, IOptions<RefreshTokenProviderOptions> options, ILogger<DataProtectorTokenProvider<TUser>> logger) : DataProtectorTokenProvider<TUser>(dataProtectionProvider, options, logger) where TUser : class
    {
    }

    public class RefreshTokenProviderOptions : DataProtectionTokenProviderOptions
    {
        public RefreshTokenProviderOptions()
        {
        }
    }
}
