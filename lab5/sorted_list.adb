with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

package body Sorted_List is
   
   
   
   function Empty(Item: in List_Type) return Boolean is
   begin
      return Item.Data = 0;
   end Empty;
   
   
   function Length(Item: in List_Type) return Natural is   
   begin
      if Item= null then
	 return 0;
      else
	 return 1 +Length(Item.Next);
      end if;
   end Length;
   
   
   
   procedure Insert_First(Int: in Integer; List: in out List_Type) is
      List2: List_Type;
   begin
      if List = null then
	 List:= new Element_Type;
	 List.Data:= Int;
	 List.Next:= null;
      else
	 List2:= new Element_Type;
	 List2.Data:= Int;
	 List2.Next:= List;
      end if;
   end Insert_First;
   
   
   procedure Insert(Int: in Integer; List: in out List_Type) is
   begin
      if List = null then
	 Insert_First(Int, List);
      elsif List.Data > Int then
	 Insert_First(Int, List);
      elsif List.Data = Int then
	 return;
      else
	 Insert(Int, List.Next);
      end if;
   end Insert;
   
   
   procedure Put(Item: in List_Type) is
   begin
      if Item.Next = null then
	 Put(Item.Data, Width => 0);
	 return;
      else
	 Put(Item.Data, Width => 0);
	 Put(Item.Next);
      end if;
   end Put;
   
   
   function Member(List: in List_Type; Int: in Integer) return Boolean is
   begin
      if Int = List.Data then
	 return True;
      elsif List.Next /= null then
	 return Member(List.Next, Int);
      else
	 return False;
      end if;
   end Member;
   
   
   procedure Free is
      new Ada.Unchecked_Deallocation(Element_Type, List_Type);
   
   
   procedure Remove(List: in out List_Type; Int: in Integer) is
      
      procedure Freemover(List: in out List_Type) is
      begin
	 if Length(List) > 2 then
	    List.Data:= List.Next.Data;
	    Freemover(List.Next);
	 elsif Length(List) = 1 then
	    Free(List);
	 else
	    List.Data:= List.Next.Data;
	    Free(List.Next);
	    List.Next:= null;
	 end if;
      end Freemover;
      
   begin
      if List.Data /= Int and Length(List) > 1 then
	 Remove(List.Next, Int);
      elsif List.Data = Int then
	 Freemover(List);
      else
	 raise Remove_Error;
      end if;	 
   end Remove;
   
   
   
   procedure Delete(List: in out List_Type) is
   begin
      if List.Next/= null then
	 Delete(List.Next);
      else
	 Free(List);
      end if;
      
      if Length(List) /= 0 then
	 Delete(List);
      end if;
   end Delete;
   
   
   
   function Find(Item: in List_Type; Int: in Integer) return Integer is
   begin
      if Item.Data /= Int and Length(Item) > 1 then
	 return(Find(Item.Next, Int));
      elsif Item.Data = Int then
	 return Int;
      else
	 raise Find_Error;
      end if;
   end Find;
   
   
   procedure Find(Item: in List_Type; Int: in out Integer) is
   begin
      if Item.Data /= Int and Length(Item) > 1 then
	 Find(Item.Next, Int);
      elsif Item.Data = Int then
	 return;
      else
	 raise Find_Error;
      end if;
   end Find;
   
   
   
   
end Sorted_List;
