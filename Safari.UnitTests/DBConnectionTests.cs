using Safari.Data.DataContext;

namespace Safari.UnitTests
{
    public class DBConnectionTests
    {
        [Fact]
        public void DBConnectTest()
        {
            using (WildlifeDataContext db = new())
            {
                Assert.True(db.Database.CanConnect());
            }
        }

        [Fact]
        public void DietTypeCount()
        {
            using (WildlifeDataContext db = new())
            {
                Assert.Equal(3, db.DietTypes.Count());
            }
        }
    }
}