using Microsoft.AspNetCore.Identity;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Safari.Data;

public class WildlifeRepository : IWildlifeRepository
{
    private readonly WildlifeDataContext _context;
    private readonly UserManager<IdentityUser> _userManager;

    public WildlifeRepository(WildlifeDataContext context, UserManager<IdentityUser> userManager)
    {
        _context = context;
        _userManager = userManager;
    }

    public async Task<int> AddAnimalAsync(Animal animal)
    {
        var NewAnimalID = new SqlParameter("@NewAnimalID", System.Data.SqlDbType.Int)
        {
            Direction = System.Data.ParameterDirection.Output
        };

        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC insert_animal @Name, @AnimalTypeId, @DietTypeId, @Weight, @Height, @Length, @IsEndangered, @AverageLifeSpan, @NewAnimalID Output, @Success Output, @ErrorMsg Output",
                    new SqlParameter("@Name", animal.Name),
                    new SqlParameter("@AnimalTypeId", animal.AnimalTypeId ?? (object)DBNull.Value),
                    new SqlParameter("@DietTypeId", animal.DietTypeId ?? (object)DBNull.Value),
                    new SqlParameter("@Weight", animal.Weight ?? (object)DBNull.Value),
                    new SqlParameter("@Height", animal.Height ?? (object)DBNull.Value),
                    new SqlParameter("@Length", animal.Length ?? (object)DBNull.Value),
                    new SqlParameter("@IsEndangered", animal.IsEndangered ?? false),
                    new SqlParameter("@AverageLifeSpan", animal.Lifespan ?? (object)DBNull.Value),
                    NewAnimalID
                    );

        return (int)NewAnimalID.Value;
    }

    public async Task AddAnimalDescriptionAsync(int AnimalID, AnimalDescription AnimalDescription)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC insert_animaldescription @AnimalID, @Description, @Success Output, @ErrorMsg Output",
            new SqlParameter("@AnimalID", AnimalID),
            new SqlParameter("@Description", AnimalDescription.Description));
    }

    public async Task AddAnimalPicAsync(int AnimalID, AnimalPic AnimalPic)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @NewAnimalPicID int, @Success bit, @ErrorMsg nvarchar(50); EXEC insert_animalpic @AnimalID, @FileName, @FilePath, @AltText, @Source, @NewAnimalPicID Output, @Success Output, @ErrorMsg Output",
            new SqlParameter("@AnimalID", AnimalID),
            new SqlParameter("@FileName", AnimalPic.FileName),
            new SqlParameter("@FilePath", AnimalPic.FilePath),
            new SqlParameter("@AltText", AnimalPic.AltText ?? (object)DBNull.Value),
            new SqlParameter("@Source", AnimalPic.Source ?? (object)DBNull.Value));
    }

    public async Task AddAnimalStateAsync(int AnimalID, int StateID)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @NewAnimalStateID int, @Success bit, @ErrorMsg nvarchar(50); EXEC insert_animalstate @AnimalID, @StateID, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output",
            new SqlParameter("@AnimalID", AnimalID),
            new SqlParameter("@StateID", StateID));
    }

    public async Task UpdateAnimalAsync(Animal Animal)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC update_animal @AnimalID, @Name, @AnimalTypeId, @DietTypeId, @Weight, @Height, @Length, @IsEndangered, @AverageLifeSpan, @IsApproved, @Success Output, @ErrorMsg Output",
            new SqlParameter("@AnimalID", Animal.AnimalId),
            new SqlParameter("@Name", Animal.Name),
            new SqlParameter("@AnimalTypeId", Animal.AnimalTypeId ?? (object)DBNull.Value),
            new SqlParameter("@DietTypeId", Animal.DietTypeId ?? (object)DBNull.Value),
            new SqlParameter("@Weight", Animal.Weight ?? (object)DBNull.Value),
            new SqlParameter("@Height", Animal.Height ?? (object)DBNull.Value),
            new SqlParameter("@Length", Animal.Length ?? (object)DBNull.Value),
            new SqlParameter("@IsEndangered", Animal.IsEndangered ?? false),
            new SqlParameter("@AverageLifeSpan", Animal.Lifespan ?? (object)DBNull.Value),
            new SqlParameter("@IsApproved", Animal.IsApproved));
    }

    public async Task UpdateAnimalDescriptionAsync(AnimalDescription AnimalDescription)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC update_animaldescription @AnimalDescriptionID, @AnimalID, @Description, @Success Output, @ErrorMsg Output",
                       new SqlParameter("@AnimalDescriptionID", AnimalDescription.AnimalDescriptionId),
                                  new SqlParameter("@AnimalID", AnimalDescription.AnimalId),
                                             new SqlParameter("@Description", AnimalDescription.Description));
    }

    public async Task UpdateAnimalPicAsync(AnimalPic AnimalPic)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC update_animalpic @AnimalPicID, @AnimalID, @AltText, @Source, @IsApproved, @Success Output, @ErrorMsg Output",
            new SqlParameter("@AnimalPicID", AnimalPic.AnimalPicId),
            new SqlParameter("@AnimalID", AnimalPic.AnimalId),
            new SqlParameter("@AltText", AnimalPic.AltText ?? (object)DBNull.Value),
            new SqlParameter("@Source", AnimalPic.Source ?? (object)DBNull.Value),
            new SqlParameter("@IsApproved", AnimalPic.IsApproved));            
    }

    public async Task DeleteAnimalPicAsync(AnimalPic AnimalPic)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC delete_animalpic @AnimalPicID, @Success Output, @ErrorMsg Output",
                       new SqlParameter("@AnimalPicID", AnimalPic.AnimalPicId));
    }

    public async Task DeleteAnimal(int AnimalID)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC delete_animal @AnimalID, @Success Output, @ErrorMsg Output",
                                  new SqlParameter("@AnimalID", AnimalID));
    }
}
