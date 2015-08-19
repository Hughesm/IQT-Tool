using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Interfaces
/// </summary>
public interface iWindowsAuth 
{
   string UserName { get; set; }
   string FullName { get; set; }
   string AreaChosen { get; set; }

    string GetFullName();
    string GetUsername();
    void TrackerSql();

}

public interface iSearch
{
    
    string idinref { get; set; } //Incident Number

    string BuildIncidentQuery(string IncidentNumber);
    DataSet PopulateIncidentData(string IncidentNumber);    
    DataSet NarrativeLog(string incidentnumber, int FilterIndex); //class/method should be able to filter the log pre and post NWFC
    DataSet IncidentEquipment(string IncidentNumber);
    DataSet IncidentMobilisation(string Incidentnumber);
   
}

	
