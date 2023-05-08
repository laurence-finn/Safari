using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Safari.Data
{
    public interface IWildlifeRepository<T>
    {
        Task<IEnumerable<T>> GetAllAsync();
        Task<T> GetByIDAsync(int id);
        Task AddAsync(T entity);
        Task UpdateAsync(T entity);
        Task DeleteAsync(int id);
    }
}
