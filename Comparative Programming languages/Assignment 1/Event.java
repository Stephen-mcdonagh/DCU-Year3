
//An event has a date, a start time and a location.
public class Event 
{
	String date = "DD-MM-YYYY";
	int startTime;
	String location ;

	public Event(String date, int startTime2, String location2) 
	{
		this.date = date;
		this.startTime= startTime2;
		this.location=location2;
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
	
	public String getLocation() 
	{
		return location;
	}

	public void setLocation(String myLocation) 
	{
		this.location = myLocation;
	}
	
	public String toString()
	{
		StringBuilder builder = new StringBuilder();
        builder.append(" MY NEW EVENT :")
        		.append("Date of this event :").append(this.getDate())
                .append("\nStart time of the event :").append(this.getStartTime())
                .append("\nLocation of event:").append(this.getLocation());
        return builder.toString();
    }

}
