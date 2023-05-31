using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Safari.Data;

public interface IWildlifeRepository
{
    Task<int> AddAnimalAsync(Animal animal);
    Task AddAnimalDescriptionAsync(int AnimalID, AnimalDescription AnimalDescription);
    Task AddAnimalPicAsync(int AnimalID, AnimalPic AnimalPic);
    Task AddAnimalStateAsync(int AnimalID, int StateID);
}
