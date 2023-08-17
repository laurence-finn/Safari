//File:  WildlifeRepository.cs
//Class:  WildlifeRepository
//Description: This class implements the IWildlifeRepository interface. All of the methods are used to manipulate the database.
//Safari uses stored procedures, so all of the methods call a stored procedure to create, update, or delete data.

//*************
//Reusable Code
//*************
//This repository contains a number of calls to SQL stored procedures which are reused throughout the pages on the website.
//For example, the Submit Image and Submit Animal pages both invoke AddAnimalPicAsync, which adds an image's information
//to the database. Using reusable code avoids the need to repeat this code on both of those pages.

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

    //Constructor    
    public WildlifeRepository(WildlifeDataContext context, UserManager<IdentityUser> userManager)
    {
        _context = context;        
        _userManager = userManager;
    }

    //AddAnimalAsync: This method calls the insert_animal stored procedure to add an animal to the database.
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

    //AddAnimalDescriptionAsync: This method calls the insert_animaldescription stored procedure to add an animal description to the database.
    public async Task AddAnimalDescriptionAsync(int AnimalID, AnimalDescription AnimalDescription)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC insert_animaldescription @AnimalID, @Description, @Success Output, @ErrorMsg Output",
            new SqlParameter("@AnimalID", AnimalID),
            new SqlParameter("@Description", AnimalDescription.Description));
    }

    //AddAnimalPicAsync: This method calls the insert_animalpic stored procedure to add an animal picture to the database.
    public async Task AddAnimalPicAsync(int AnimalID, AnimalPic AnimalPic)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @NewAnimalPicID int, @Success bit, @ErrorMsg nvarchar(50); EXEC insert_animalpic @AnimalID, @FileName, @FilePath, @AltText, @Source, @NewAnimalPicID Output, @Success Output, @ErrorMsg Output",
            new SqlParameter("@AnimalID", AnimalID),
            new SqlParameter("@FileName", AnimalPic.FileName),
            new SqlParameter("@FilePath", AnimalPic.FilePath),
            new SqlParameter("@AltText", AnimalPic.AltText ?? (object)DBNull.Value),
            new SqlParameter("@Source", AnimalPic.Source ?? (object)DBNull.Value));
    }

    //AddAnimalStateAsync: This method calls the insert_animalstate stored procedure to add an animal state to the database.
    public async Task AddAnimalStateAsync(int AnimalID, int StateID)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @NewAnimalStateID int, @Success bit, @ErrorMsg nvarchar(50); EXEC insert_animalstate @AnimalID, @StateID, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output",
            new SqlParameter("@AnimalID", AnimalID),
            new SqlParameter("@StateID", StateID));
    }

    //UpdateAnimalAsync: This method calls the update_animal stored procedure to update an animal in the database.   
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

    //UpdateAnimalDescriptionAsync: This method calls the update_animaldescription stored procedure to update an animal description in the database.
    public async Task UpdateAnimalDescriptionAsync(AnimalDescription AnimalDescription)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC update_animaldescription @AnimalDescriptionID, @AnimalID, @Description, @Success Output, @ErrorMsg Output",
                       new SqlParameter("@AnimalDescriptionID", AnimalDescription.AnimalDescriptionId),
                                  new SqlParameter("@AnimalID", AnimalDescription.AnimalId),
                                             new SqlParameter("@Description", AnimalDescription.Description));
    }

    //UpdateAnimalPicAsync: This method calls the update_animalpic stored procedure to update an animal picture in the database.
    public async Task UpdateAnimalPicAsync(AnimalPic AnimalPic)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC update_animalpic @AnimalPicID, @AnimalID, @AltText, @Source, @IsApproved, @Success Output, @ErrorMsg Output",
            new SqlParameter("@AnimalPicID", AnimalPic.AnimalPicId),
            new SqlParameter("@AnimalID", AnimalPic.AnimalId),
            new SqlParameter("@AltText", AnimalPic.AltText ?? (object)DBNull.Value),
            new SqlParameter("@Source", AnimalPic.Source ?? (object)DBNull.Value),
            new SqlParameter("@IsApproved", AnimalPic.IsApproved));            
    }

    //DeleteAnimalPicAsync: This method calls the delete_animalpic stored procedure to delete an animal picture from the database.
    public async Task DeleteAnimalPicAsync(AnimalPic AnimalPic)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC delete_animalpic @AnimalPicID, @Success Output, @ErrorMsg Output",
                       new SqlParameter("@AnimalPicID", AnimalPic.AnimalPicId));
    }

    //DeleteAnimalAsync: This method calls the delete_animal stored procedure to delete an animal from the database.
    //This stored procedure also deletes all animal descriptions, pictures, and states associated with the animal.
    public async Task DeleteAnimalAsync(int AnimalID)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC delete_animal @AnimalID, @Success Output, @ErrorMsg Output",
                                  new SqlParameter("@AnimalID", AnimalID));
    }

    //DeleteAllAnimalStateAsync: This method calls the delete_allanimalstate stored procedure to delete all animal states associated with an animal from the database.
    //This is used when updating an animal's states; the existing states are deleted and then the new states are added.
    public async Task DeleteAllAnimalStateAsync(int AnimalID)
    {
        await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC delete_allanimalstate @AnimalID, @Success Output, @ErrorMsg Output",
                                  new SqlParameter("@AnimalID", AnimalID));
    }
}
