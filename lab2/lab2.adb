with Ada.Text_IO;		        use Ada.Text_IO;
with Ada.Integer_Text_IO;    	        use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Create_Vector_Data;

procedure Lab2 is
----MAIN----
   Xa, Ya, Za, Xb, Yb, Zb : Integer;
   L, Vy, Vz : Integer;
begin
   Put("Mata in punkten A i cm (X, Y, Z): ");
   Get(Xa);
   Get(Ya);
   Get(Za);
   Put("Mata in punkten B i cm (X, Y, Z): ");
   Get(Xb);
   Get(Yb);
   Get(Zb);
   
   Create_Vector_Data(Xa, Ya, Za, Xb, Yb, Zb, L, Vy, Vz);
   
   Put_Line("Längd (i m)     Vy     Vz");
   Put(L,  Width => 11);
   Put(Vy, Width => 7);
   Put(Vz, Width => 7);
   New_Line;
end Lab2;
