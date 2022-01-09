with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random;


procedure Laboration3 is
   
   type Twenty_Array_Type is array (1..20) of Integer;
   A: Twenty_Array_Type;
   
   
----GENERATE----
   procedure Generate(Arr: in out Twenty_Array_Type) is
      I: Integer;
      Random: Float;
      G: Ada.Numerics.Float_Random.Generator;
   begin
      Ada.Numerics.Float_Random.Reset(G);
      for J in 1..20 Loop
	 Random:= Ada.Numerics.Float_Random.Random(G);
	 I:= Integer(Float'Ceiling(Random*10.0));
	 Arr(J):= I;
	 Put(Arr(J), Width => 2);
	 New_Line;
      end loop;
      New_Line(3);
   end Generate;
   
   
----SWAP----
   procedure Swap(A, B: in out Integer) is
      Ref: Integer;
   begin
      Ref:= A;
      A:= B;
      B:= Ref;
   end Swap;
   
   
----SORT----
   procedure Sort(Arr: in out Twenty_Array_Type) is
      
   begin
      for J in 1..20 loop
         for Q in 2..20 loop
            if A(J) > A(Q) and Q > J then
	       Swap(A(Q-1), A(Q));
            end if;
         end loop;
      Put(A(J), Width => 2);
      New_Line;
      end loop;
   end Sort;
   
   
   
   
begin
   Generate(A);
   Sort(A);	    
   
   
   
   
end Laboration3;
