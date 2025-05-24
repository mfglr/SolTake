using Microsoft.AspNetCore.Mvc;

namespace SolTake.Api.Controllers
{
    [Route("/")]
    public class HomeController : Controller
    {
        public IActionResult Index() => View();
    }
}
