with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

package body Date_Handling is
   
   procedure Get(Item: out Date_Type) is
      S: String(1..10);
      Antal_Dagar: array(1..12) of Integer:= (31,28,31,30,31,30,31,31,30,31,30,31);
      
   begin
      Get(S);
      if S(9) in '0'..'9' and S(10) in '0'..'9' then
         Item.Day:= Integer'Value(S(9..10));
      else
	 raise Format_Error;
      end if;
      
      if S(6) in '0'..'9' and S(7) in '0'..'9' then
         Item.Month:= Integer'Value(S(6..7));
      else
	 raise Format_Error;
      end if;
      
      if S(1) in '0'..'9' and S(2) in '0'..'9' and S(3) in '0'..'9' and S(4) in '0'..'9' then
      Item.Year:= Integer'Value(S(1..4));
      else
	 raise Format_Error;
      end if;

      
      if Item.Year < 0 then
	 raise Year_Error;
      elsif Item.Month < 1 or Item.Month > 12 then
	 raise Month_Error;
      elsif Item.Day < 0 or Item.Day > Antal_Dagar(Item.Month) then
	 raise Day_Error;
      elsif S(5) /= '-' or S(8) /= '-' then
	 raise Format_Error;
      end if;
      
   end Get;
   
   procedure Put(Item: in Date_Type) is
   begin
      Put(Item.Year, Width => 4);
      Put("-");
      if Item.Month < 10 then
         Put(0, Width => 0);
         Put(Item.Month, Width => 1);
      else
	 Put(Item.Month, Width => 2);
      end if;
      Put("-");
      if Item.Day < 10 then
         Put(0, Width => 1);
         Put(Item.Day, Width => 1);
      else
	 Put(Item.Day, Width => 2);
      end if;
   end Put;
   
   
   function Next_Date(In_Date: in Date_Type) return Date_Type is
      Item : Date_Type := In_Date;
   begin
      if Item.Day = 31 and Item.Month = 12 then
	 Item.Day:= 1;
	 Item.Month:= 1;
	 Item.Year:= Item.Year +1;
      elsif (Item.Day = 31 and (Item.Month = 1 or Item.Month = 3 or Item.Month = 5 or 
			 	Item.Month = 7 or Item.Month = 8 or Item.Month = 10)) 
	  or (Item.Day = 30 and (Item.Month = 4 or Item.Month = 6 or Item.Month = 9 or 
				 Item.Month = 11))
          or ((Item.Day = 28) and (Item.Month = 2)) then
	 Item.Day := 1;
	 Item.Month:= Item.Month +1;
      else
	 Item.Day:= Item.Day +1;
      end if;
      return Item;
   end Next_Date;
   
   
   function Previous_Date(In_Date: in Date_Type) return Date_Type is
      Item : Date_Type := In_Date;
   begin
      if Item.Day = 1 and Item.Month = 1 then
	 Item.Day:= 31;
	 Item.Month:= 12;
	 Item.Year:= Item.Year -1;
      elsif Item.Day = 1 and (Item.Month = 5 or Item.Month = 7 or Item.Month = 8 
		      	   or Item.Month = 10 or Item.Month = 12) then
	 Item.Month:= Item.Month -1;
	 Item.Day:= 30;
      elsif Item.Day = 1 and (Item.Month = 2 or Item.Month = 4 or Item.Month = 6 or 
			      Item.Month = 9 or Item.Month = 11) then
	 Item.Month:= Item.Month -1;
	 Item.Day:= 31;
      elsif Item.Day = 1 and Item.Month = 3 then
	 Item.Day := 28;
	 Item.Month:= 2;
      else
	 Item.Day:= Item.Day -1;
      end if;
      return Item;
   end Previous_Date;
   
   function "<"(L, R: in Date_Type) return Boolean is
   begin
      if L.Year /= R.Year then
	 return L.Year < R.Year;
      elsif L.Month /= R.Month then
	 return L.Month < R.Month;
      else
	 return L.Day < R.Day;
      end if;
   end "<";
   
   function ">"(L, R: in Date_Type) return Boolean is
   begin
      if L.Year /= R.Year then
	 return L.Year > R.Year;
      elsif L.Month /= R.Month then
	 return L.Month > R.Month;
      else
	 return L.Day > R.Day;
      end if;
   end ">";
   
   function "="(L, R: in Date_Type) return Boolean is
   begin
      return (L.Year = R.Year and L.Month = R.Month and L.Day = R.Day);
   end "=";
   
   procedure Swap(A, B: in out Date_Type) is
      Ref: Date_Type;
   begin
      Ref:= A;
      A:= B;
      B:= Ref;
   end Swap;
   
end Date_Handling;
