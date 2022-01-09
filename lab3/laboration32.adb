with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;         use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random;


procedure Laboration32 is
   
   type Small_Array_Type is array (1..2) of Integer;
   type Big_Array_Type is array (1..20) of Small_Array_Type;
   
   A: Big_Array_Type;
   
   
----PUT_BIG----
   procedure Put(Arr: in out Big_Array_Type) is
      
   begin
      for J in 1..20 loop
	 Put(Arr(J)(1), Width => 3);
	 Put(Arr(J)(2), Width => 4);
	 New_Line;
      end loop;
   end Put;
   
   
----GENERATE----
   procedure Generate(Arr: in out Big_Array_Type) is
      I: Integer;
      Random: Float;
      G: Ada.Numerics.Float_Random.Generator;
   begin
      Ada.Numerics.Float_Random.Reset(G);
      for P in 1..2 loop
         for J in 1..20 Loop
	    Random:= Ada.Numerics.Float_Random.Random(G);
	    I:= Integer(Float'Ceiling(Random*10.0));
	    Arr(J)(P):= I;
         end loop;
      end loop;
   end Generate;
   
   
----SWAP_INT----
   procedure Swap(A, B: in out Integer) is
      Ref: Integer;
   begin
      Ref:= A;
      A:= B;
      B:= Ref;
   end Swap;   
   
   
----">"----
   function ">"(L, R: in Small_Array_Type) return Boolean is
   begin
      return L(2) > R(2) or ( L(2) = R(2) and L(1) > R(1) );
      --  if L(2) > R(2) or ( L(2) = R(2) and L(1) > R(1) ) then
      --  	 return TRUE;
      --  end if;
      --  return False;
      
      --  if L(2) > R(2) then
      --  	 return TRUE;
      --  Elsif L(2) < R(2) then
      --  	 return FALSE;
      --  else
      --  	 if L(1) < R(1) then
      --  	    return False;
      --  	 else
      --  	    return True;
      --  	 end if;
      --  end if;
   end ">";
   
   
----SWAP_Small_Array----
   procedure Swap(A, B: in out Small_Array_Type) is
      Ref: Small_Array_Type;
   begin
      Ref:= A;
      A:= B;
      B:= Ref;
   end Swap;
   
   
----SORT----
   procedure Sort(Arr: in out Big_Array_Type) is
      
   begin
      for J in 1..20 loop
         for Q in 1..20 loop
            if Arr(J) > Arr(Q) and Q > J then
	       Swap(Arr(J), Arr(Q));
            end if;
         end loop;
      end loop;
      
   end Sort;
   
   
begin
   Generate(A);
   Put(Arr);
   New_Line;
   Sort(A);
   Put(Arr);
   
end Laboration32;
