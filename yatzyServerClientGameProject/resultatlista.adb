with Ada.Text_IO;                          use Ada.Text_IO;
with Ada.Integer_Text_IO;                  use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                    use Ada.Float_Text_IO;
with Ada.Numerics;                         use Ada.Numerics;
with Ada.Numerics.Elementary_Functions;    use Ada.Numerics.Elementary_Functions;
with Ada.Numerics.Float_Random;

package body Resultatlista is
   
   
   procedure Totalsum(Item: in out Table_Type) is      
   begin
      Item.Total_Sum := 0;
      if Item.One/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.One; 
      end if;
      if  Item.Two/= 100 then
	 Item.Total_Sum:= Item.Total_Sum +  Item.Two; 
      end if; 
      if Item.Three/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Three; 
      end if; 
      if Item.Four/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Four; 
      end if; 	 
      if Item.Five/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Five;
      end if; 	 
      if Item.Six/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Six;
      end if; 	 
      if Item.Bonus/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Bonus; 
      end if;  
      if Item.Pair/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Pair; 
      end if; 	 	 
      if Item.Two_Pair/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Two_Pair; 
      end if; 	 
      if Item.Tripple/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Tripple;
      end if; 	 
      if Item.Quads/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Quads; 
      end if; 	 
      if Item.Full_House/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Full_House; 
      end if; 	 
      if Item.Small_Straight/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Small_Straight; 
      end if;	 
      if Item.Big_Straight/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Big_Straight;
      end if;	 
      if Item.Chance/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Chance; 
      end if;
      if Item.Yatzy/= 100 then
	 Item.Total_Sum:= Item.Total_Sum + Item.Yatzy;
      end if;	 
   end Totalsum;   
   
   procedure Puttiluring(Item: in Table_Type) is
   begin
      Put("------------------------------------------------------------");
      New_Line;
      Put("1. One's: ");
      Put(Item.One,1);
      New_Line;
      Put("2. Two's: ");
      Put(Item.Two,1);
      New_Line;
      Put("3. Three's: ");
      Put(Item.Three,1);
      New_Line;
      Put("4. Four's: ");
      Put(Item.Four,1);
      New_Line;
      Put("5. Five's: ");
      Put(Item.Five,1);
      New_Line;
      Put("6. Six's: ");
      Put(Item.Six,1);
      New_Line;
      Put("-- Bonus: ");
      Put(Item.Bonus,1);
      New_Line;
      Put("7. Pair: ");
      Put(Item.Pair,1);
      New_Line;
      Put("8. Two Pair: ");
      Put(Item.Two_Pair,1);
      New_Line;
      Put("9. Three of a kind: ");
      Put(Item.Tripple,1);
      New_Line;
      Put("10. Quads: ");
      Put(Item.Quads,1);
      New_Line;
      Put("11. Full House: ");
      Put(Item.Full_House, Width => 1);
      New_Line;
      Put("12. Small Straight: ");
      Put(Item.Small_Straight,1);
      New_Line;
      Put("13. Big Straight: ");
      Put(Item.Big_Straight,1);
      New_Line;
      Put("14. Chance: ");
      Put(Item.Chance,1);
      New_Line;
      Put("15. Jatsy: ");
      Put(Item.Yatzy,1);
      New_Line;
      Put("-- Total: ");
      Put(Item.Total_Sum,1);
      New_Line;
      Put("------------------------------------------------------------");
      
      end Puttiluring;
      
   procedure Shuffle(Dice: in out Integer) is
      G: Ada.Numerics.Float_Random.Generator;
   begin
      Ada.Numerics.Float_Random.Reset(G);
      Dice:= Integer(Float'Ceiling(Ada.Numerics.Float_Random.Random(G)*Float(6)));
   end Shuffle;
   
    procedure Swap(Left,Right: in out Integer) is
      C: Integer;
   begin
      C:=Left;
      Left:=Right;
      Right:=C;
   end Swap;
   
   
   procedure Sort(Item: in out Array_Type) is
   begin
      for I in 1..5 loop
	 for J in 1..4 loop
	    
	    if Item(J)>Item(J+1)then
	       Swap(Item(J),Item(J+1));
	    end if;
	 end loop;
      end loop;
      
   end Sort;
   
   
    procedure Bonus(Item: in out Table_Type) is
      I: Integer:= 0;
   begin
      if Item.One /= 100 then
	 I:= I + Item.One; end if;
      if Item.Two /= 100 then
	 I:= I + Item.Two; end if;
      if Item.Three /= 100 then
	 I:= I + Item.Three; end if;      
      if Item.Four /= 100 then
	 I:= I + Item.Four; end if;      
      if Item.Five /= 100 then
	 I:= I + Item.Five; end if;      
      if Item.Six /= 100 then
	 I:= I + Item.Six; end if;
      if I > 62 then
	 Item.Bonus:= 50;
      else
	 Item.Bonus:= 0;
      end if;
   end Bonus;
   
   
   
   function One(Tarning: in Array_Type; Item: in Table_Type)
	       return Integer is
      P: Integer:= 0;
   begin
      if (Item.One /= 0 or Item.One = 100) then
	 raise Decision_Error;
      else
	 for I in 1..5 loop
	    if Tarning(I) = 1
	    then P:= P +1;
	    end if;
	 end loop; 
      end if;
      if P=0 then
	 P:= 100; 
      end if;
      return P;
   end One;
   


   function Two(Tarning: in Array_Type; Item: in Table_Type)
	       return Integer is
      P: Integer:= 0;
   begin
      if (Item.Two /= 0 or Item.Two = 100) then
	 raise Decision_Error;
      else
	 for I in 1..5 loop
	    if Tarning(I) = 2
	    then P:= P +2;
	    end if;
	 end loop;
      end if;
      if P=0 then
	 P:= 100;
      end if;
      return P;
   end Two;
   


   function Three(Tarning: in Array_Type; Item: in Table_Type)
		 return Integer is
      
      P: Integer:= 0;
   begin
      if (Item.Three /= 0 or Item.Three = 100) then
	 raise Decision_Error;
      else
	 for I in 1..5 loop
	    if Tarning(I) = 3
	    then P:= P+3;
	    end if;
	 end loop;
      end if;
      if P=0 then
	 P:= 100;
      end if;
      return P;
   end Three;
   

   
   function Four(Tarning: in Array_Type; Item: in Table_Type)
		return Integer is
      
      P: Integer:= 0;
   begin
      if (Item.Four /= 0 or Item.Four = 100) then
	 raise Decision_Error;
      else
	 for I in 1..5 loop
	    if Tarning(I) = 4
	    then P:= P+4;
	    end if;
	 end loop;
      end if;
      if P=0 then
	 P:= 100;
      end if;
      return P;
   end Four;
   


   function Five(Tarning: in Array_Type; Item: in Table_Type)
		return Integer is
      P: Integer:= 0;
   begin
      if (Item.Five /= 0 or Item.Five = 100) then
	 raise Decision_Error;
      else
	 for I in 1..5 loop
	    if Tarning(I) = 5
	    then P:= P+5;
	    end if;
	 end loop;
      end if;
      if P=0 then
	 P:= 100;
      end if;
      return P;
   end Five;
   
   

   function Six(Tarning: in Array_Type; Item: in Table_Type)
	       return Integer is
      
      P: Integer:= 0;
   begin
      if (Item.Six /= 0 or Item.Six = 100) then
	 raise Decision_Error;
      else
	 for I in 1..5 loop
	    if Tarning(I) = 6
	    then P:= P+6;
	    end if;
	 end loop;
      end if;
      if P=0 then
	 P:= 100;
      end if;
      return P;
      end Six;


   
   function Pair(Tarning: in Array_Type; Item: in Table_Type)
		return Integer is
      C,D: Integer := 0;
      O,P: Integer;
   begin
      
      if Item.Pair /= 0 then
	 raise Decision_Error;
      elsif Item.Pair = 0 then
	 for A in 1..4 loop
	    if Tarning(A) = Tarning(A+1) then
	       C:= Tarning(A) * 2;
	       P:= A+1;
	    end if;
	 end loop;
	 
	 if  C /= 0 then
	 
	 for B in P..4 loop
	    if Tarning(B) = Tarning(B+1) then
	       D:= Tarning(B+1)*2;
	       
	    end if;
	 end loop; 
	 end if;
      end if;
      
      if C = 0 and D = 0 then
	 O:=100;
      end if;
      if C<D then
	 O:= D;
      elsif C>D then
	 O:= C;
      end if;
      return O;
      
   end Pair;
  
   

   
   function Two_Pair(Tarning: in Array_Type; Item: in Table_type)
		    return Integer is
   function Pair2(Tarning: in Array_Type; Item: in Table_Type)
		return Integer is
      C,D: Integer := 0;
      O,P: Integer := 0;
   begin

	 for A in 1..4 loop
	    if Tarning(A) = Tarning(A+1) then
	       C:= Tarning(A) * 2;
	       P:= A+1;
	    end if;
	 end loop;
	 
	 if  C /= 0 then
	 
	 for B in P..4 loop
	    if Tarning(B) = Tarning(B+1) then
	       D:= Tarning(B+1)*2;
	       
	    end if;
	 end loop; 
	 end if;

      
      if C = 0 and D = 0 then
	 O:=100;
      end if;
      if C<D then
	 O:= D;
      elsif C>D then
	 O:= C;
      end if;
      return O;
      
   end Pair2;
   
      E: Integer:= 0;
      O: Integer := 0;
   begin
      if Pair2(Tarning,Item) /= 100 then
      O:= Pair2(Tarning,Item)/2;
      end if;
      
      if Item.Two_Pair /= 0 then
	 raise Decision_Error;
      elsif Item.Two_Pair = 0 and O /= 0 then
       	 for A in  1..4 loop
	    if Tarning(A) = Tarning(A+1) and Tarning(A) /= O then
	       E:= O*2 + Tarning(A)*2;
	    end if;
	 end loop;	
      end if;
       if E = 0 then
	    E:=100;
       end if;
      return E;
   end Two_Pair;
   

   
   function Tripple(Tarning: in Array_Type;
		    Item: in Table_Type) return Integer is
      D: Integer:= 0;
   begin
      if Item.Tripple /= 0 then
	 raise Decision_Error;
      elsif Item.Tripple = 0  then
	 
       	 for A in  1..3 loop
	    if Tarning(A) = Tarning(A+1) and Tarning(A) = Tarning(A+2) then
	       D:= Tarning(A)*3;
	    end if;
	 end loop;

	 if D= 0 then
	    D:=100;
	 end if;
	 
      end if;
      return D;
   end Tripple;
   
	 
   
   function Quad(Tarning: in Array_Type;
		 Item: in Table_Type) return Integer is
      
      
      E: Integer:= 0;

   begin
      
      if Item.Quads /= 0 then
	 raise Decision_Error;
      elsif Item.Quads = 0 then
	 
	 for A in 1..2 loop
	    if Tarning(A) = Tarning(A+1) and Tarning(A) = Tarning(A+2)
	      and Tarning(A) = Tarning(A+3) then
			E:= Tarning(A)*4;
		    
		     end if;
	 end loop;
	 if E = 0 then 
	    E:=100;
	 end if;
      end if;
      return E;
   end Quad;
   
   ---------------------------------------------------------------------
   
   function Full_House(Tarning: in Array_Type;
		       Item: in Table_Type) return Integer is
      function Tripple2(Tarning: in Array_Type;
			Item: in Table_Type) return Integer is
	 D: Integer:= 0;
      begin
	 
       	 for A in  1..3 loop
	    if Tarning(A) = Tarning(A+1) and Tarning(A) = Tarning(A+2) then
	       D:= Tarning(A)*3;
	    end if;
	 end loop;

	 if D= 0 then
	    D:=100;
	 end if;
	 
	 return D;
      end Tripple2;
      
      C: Integer := 0 ;
      O: Integer := 0;
   begin
      if Tripple2(Tarning,Item)/= 100 then
	 O:= Tripple2(Tarning,Item)/3;
      else
	 return 100;
      end if;
      
      if Item.Full_House /= 0 then
	 raise Decision_Error;
      elsif Item.Full_House = 0 then
	 
	 for A in 1..4 loop
	    if Tarning(A) = Tarning(A+1) and Tarning(A) /= O then
	       C:= Tarning(A)*2 + O*3;
	    end if;
	 end loop;
	 
	 
	 if C = 0 then 
	    C:=100;
	 end if;
      end if;
      return C;
   end Full_House;
   
  ----------------------------------------------------------------------     
   
   function Small_Straight(Tarning: in Array_Type;
			   Item: in Table_Type) Return Integer is
      F: Integer:= 0;
      
   begin
      
      if Item.Small_Straight /= 0 then
	 raise Decision_Error;
      elsif Item.Small_Straight = 0 then
	 if Tarning(1) = 1 and Tarning(2) = 2 and Tarning(3) = 3
	   and Tarning(4) = 4 and Tarning(5) = 5 then
	    F:= 15;
	 end if;
	 
	 if F = 0 then 
	    F:=100;
	 end if;
      end if;
      return F;
   end Small_Straight;
   
   -------------------------------------------------------------------------
   
   function Big_Straight(Tarning: in Array_Type;
			 Item: in Table_Type) return Integer is
      F: Integer:= 0;
      
   begin
      
      if Item.Big_Straight /= 0 then
	 raise Decision_Error;
      elsif Item.Big_Straight = 0 then
	 
	 if Tarning(1) = 2 and Tarning(2) = 3 and Tarning(3) = 4
	   and Tarning(4) = 5 and Tarning(5) = 6 then
	    F:= 20;
	 end if;
	 
	 if F = 0 then 
	    F:=100;
	 end if;
	 
	    
	 end if;
	 return F;
      end Big_Straight;
   
   ------------------------------------------------------------------
      function Chance(Tarning: in Array_Type; 
		      Item: in Table_Type) return Integer is
	A: Integer := 0; 
      begin
	 
	 if Item.Chance/= 0 then
	    raise Decision_Error;
	 else
	     for I in 1..5 loop
	      A:= A + Tarning(I);
	     end loop;
	     return A;
	    end if;
      end Chance;
      
      function Yatzy(Tarning: in Array_Type; 
		     Item: in Table_Type) return Integer is
	 
	 A: Integer := 0;
      begin
	 
	 if Item.Yatzy /= 0 then
	    raise Decision_Error;
	 elsif Item.Yatzy = 0 then
	    if Tarning(1) = Tarning(2) and Tarning(1) = Tarning(3)
	      and Tarning(1) = Tarning(4) and Tarning(1) = Tarning(5)
	    then
	       A:= 50;
	    end if;
	 end if;
	 if A = 0 then
	    A:=100;
	    end if;
	 return A;
      end Yatzy;
      
      procedure Kasta(Item: in out Array_Type; Ref: in Array_Type) is
      begin
	 for I in 1..5 loop
	    if Ref(I) = 1 then
	       Shuffle(Item(I));
	    end if;
	 end loop;
      end Kasta;

   
end Resultatlista;
