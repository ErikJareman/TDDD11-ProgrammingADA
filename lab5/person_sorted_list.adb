
package body Person_Sorted_List is
   function Empty(Item: in List_Type) return Boolean is
   begin
      return Item = null;
   end Empty;
   
   
   function Length(Item: in List_Type) return Natural is   
   begin
      if Item= null then
	 return 0;
      else
	 return 1 +Length(Item.Next);
      end if;
   end Length;
   
   
   
   procedure Insert_First(Int: in Person_Type; List: in out List_Type) is
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
	 List:= List2;
      end if;
   end Insert_First;
   
   
   procedure Insert(Int: in Person_Type; List: in out List_Type) is
   begin
      if List = null then
	 Insert_First(Int, List);
      elsif Get_Birth_Date(List.Data) > Get_Birth_Date(Int) then
	 Insert_First(Int, List);
      elsif Get_Birth_Date(List.Data) = Get_Birth_Date(Int) then
	 return;
      else
	 Insert(Int, List.Next);
      end if;
   end Insert;
   
   
   procedure Put(Item: in List_Type) is
   begin
      if Item.Next = null then
	 Put(Item.Data);
	 return;
      else
	 Put(Item.Data);
	 Put(Item.Next);
      end if;
   end Put;
   
   
   function Member(List: in List_Type; Int: in Date_Type) return Boolean is
   begin
      if Int = Get_Birth_Date(List.Data) then
	 return True;
      elsif List.Next /= null then
	 return Member(List.Next, Int);
      else
	 return False;
      end if;
   end Member;
   
   
   procedure Free is
      new Ada.Unchecked_Deallocation(Element_Type, List_Type);
   
   
   procedure Remove(List: in out List_Type; Int: in Date_Type) is
      
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
      if Get_Birth_Date(List.Data) /= Int and Length(List) > 1 then
	 Remove(List.Next, Int);
      elsif Get_Birth_Date(List.Data) = Int then
	 Freemover(List);
      else
	 raise Remove_Error;
      end if;	 
   end Remove;
   
   
   
   procedure Delete(List: in out List_Type) is
   begin
      if not Empty(List) then
	 if List.Next/= null then
	    Delete(List.Next);
	 else
	    Free(List);
	 end if;
	 
	 if Length(List) /= 0 then
	    Delete(List);
	 end if;
      end if;
   end Delete;
   
   
   
   function Find(Item: in List_Type; Int: in Date_Type) return Person_Type is
   begin
      if Get_Birth_Date(Item.Data) /= Int and Length(Item) > 1 then
	 return(Find(Item.Next, Int));
      elsif Get_Birth_Date(Item.Data) = Int then
	 return Item.Data;
      else
	 raise Find_Error;
      end if;
   end Find;
   
   
   procedure Find(Item: in List_Type; Int: in Date_Type; Svar: out Person_Type) is
   begin
      if Get_Birth_Date(Item.Data) /= Int and Length(Item) > 1 then
	 Find(Item.Next, Int, Svar);
      elsif Get_Birth_Date(Item.Data) = Int then
	 Svar:= Item.Data;
      else
	 raise Find_Error;
      end if;
   end Find;
   
end Person_Sorted_List;
