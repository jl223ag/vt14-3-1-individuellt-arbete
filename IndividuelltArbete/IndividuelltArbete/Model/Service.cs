using IndividuelltArbete.Model.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace IndividuelltArbete.Model
{
    public class Service
    {

        private KundDAL _kundDAL;
        private UthyrningDAL _uthyrningDAL;
        private FilmDAL _filmDAL;

        private KundDAL KundDAL
        {
            get { return _kundDAL ?? (_kundDAL = new KundDAL()); }
        }
        private UthyrningDAL UthyrningDAL
        {
            get { return _uthyrningDAL ?? (_uthyrningDAL = new UthyrningDAL()); }
        }
        private FilmDAL FilmDAL
        {
            get { return _filmDAL ?? (_filmDAL = new FilmDAL()); }
        }

        //----------------- Kund --------------------------------------------------------------
        
        public IEnumerable<Kund> GetKunder()
        {
            return KundDAL.GetKunder();
        }

        public Kund GetKundById(int kundid)
        {
            return KundDAL.GetKundById(kundid);
        }

        public void DeleteKund(int kundid)
        {
            KundDAL.DeleteKund(kundid);
        }

        public void SaveKund (Kund kund)
        {
            ICollection<ValidationResult> validationResults;

            if (!kund.Validate(out validationResults))
            {
                var ex = new ValidationException("Det failade i valideringen!");
                ex.Data.Add("ValidationResults", validationResults);
                throw ex;
            }
            if (kund.Kundid == 0)
            {
                KundDAL.InsertKund(kund);
            }
            else
            {
                KundDAL.UpdateKund(kund);
            }
        }    

    //------------------- Uthyrning ----------------------------------------------

        public IEnumerable<Uthyrning> GetUthyrningarByKundid(int kundid)
        {
            return UthyrningDAL.GetUthyrningarByKundid(kundid);
        }

        public Uthyrning GetUthyrningById(int uthyrningid)
        {
            return UthyrningDAL.GetUthyrningById(uthyrningid);
        }

        public void DeleteUthyrning(int uthyrningid)
        {
            UthyrningDAL.DeleteUthyrning(uthyrningid);
        }

        public void SaveUthyrning(Uthyrning uthyrning)
        {
            ICollection<ValidationResult> validationResults;

            if (!uthyrning.Validate(out validationResults))
            {
                var ex = new ValidationException("Det failade i valideringen!");
                ex.Data.Add("ValidationResults", validationResults);
                throw ex;
            }

            if (uthyrning.Uthyrningsid == 0)
            {
                UthyrningDAL.InsertUthyrning(uthyrning);
            }
            else
            {
                UthyrningDAL.UpdateUthyrning(uthyrning);
            }
        }
       
    //--------------- Filmer ----------------------------------

        public IEnumerable<Film> GetFilmer(bool update = false)
        {
            var filmer = HttpContext.Current.Cache["Filmer"] as IEnumerable<Film>;

            if (filmer == null || update)
            {
                filmer = FilmDAL.GetFilmer();
                HttpContext.Current.Cache.Insert("Filmer", filmer, null, DateTime.Now.AddMinutes(15), TimeSpan.Zero);
            }

            return filmer;
        }
    }
}