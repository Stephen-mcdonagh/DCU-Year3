import java.util.ArrayList;

//implement queue using array list
public class Queue 
{
	private ArrayList<Object> list;
	
	public Queue()
	{
		list= new ArrayList<Object>();
	}
	public boolean imEmpty()
	{
		return list.size()== 0;
	}
	
	// insert elements
	public void enqueue(Object item)
	{
		list.add(item);
	}
	//remove element
	public Object dequeue()
	{
		Object item = list.get(0);
		list.remove(0);
		return item;
		
	}
}
