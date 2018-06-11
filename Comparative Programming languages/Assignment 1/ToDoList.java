import java.util.ArrayList;
public class ToDoList 
{
	
	public static void main(String[] args)
	{
		String date = "12-10-2017";
        int startTime = 12;
        String duration = "2 hours";
        String location = "Dublin";

        ArrayList<String> ListOfNames = new ArrayList<String>(10);
        ListOfNames.add("keith");
        ListOfNames.add("Stephen");
        ListOfNames.add("David");
        
        Task myTask = new Task(date, startTime,duration,ListOfNames);
        Event myEvent = new Event(date,startTime,location);
        Queue myQueue = new Queue();
        
        //MY TESTS
        myQueue.enqueue(myTask);		//add first element to queue
        myQueue.enqueue(myEvent);		//add second element to queue
        //Print item at top of queue and take it off
        System.out.println("item at top of queue is :\n"+ myQueue.dequeue());	
        System.out.println(" ");
        //Print item at top of queue and take it off
        System.out.println("item at top of queue is :\n"+ myQueue.dequeue());	
	}
}



