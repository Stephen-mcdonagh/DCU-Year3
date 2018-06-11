import java.util.ArrayList;

//Tasks have a date, a start time, a duration and a list of people assigned 
//to the task.

public class Task 
{
	String date = "DD-MM-YYYY";
	int startTime;
	String duration;
	ArrayList<String> listOfPeople;
	
	public Task(String d,int t , String du, ArrayList<String> listOfNames)
	{
		this.date = d;
		this.startTime = t;
		this.duration = du;
		this.listOfPeople = listOfNames;
	}
	
	public String getDate() 
	{
		return date;
	}

	public void setDate(String mydate) 
	{
		this.date = mydate;
	}
	public int getStartTime() 
	{
		return startTime;
	}

	public void setStartTime(int myStartTime) 
	{
		this.startTime = myStartTime;
	}
	public String getduration() 
	{
		return duration;
	}

	public void setduration(String myduration) 
	{
		this.duration = myduration;
	}
	
	public ArrayList<String> getListOfPeople()
	{
		return listOfPeople;
	}
	public void setListOfPeople(ArrayList<String> mylistOfPeople) 
	{
		this.listOfPeople = mylistOfPeople;
	}
	
	public String toString()
	{
		StringBuilder builder = new StringBuilder();
        builder.append("MY NEW TASK :")
        		.append("Date of this Task :").append(this.getDate())
                .append("\n Start time of Task :").append(this.getStartTime())
                .append("\n duration of Task :").append(this.getduration())
                .append("\n List of people involved in this Task is :").append(this.getListOfPeople());
        return builder.toString();
    }

	
	
}
