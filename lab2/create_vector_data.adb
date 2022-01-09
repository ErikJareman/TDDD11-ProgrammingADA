with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Create_Vector_Data(Xa, Ya, Za, Xb, Yb, Zb: in Integer;
                                          L, Vy, Vz: out Integer) is 
   
   
----Omvandla----
   function Omvandla(V: Float) return Integer is
   begin
      return Integer(Float(V)*57.3);
   end Omvandla;
   
   
----Längd----
   procedure Length(A, B, C, AA, BB, CC: in Integer;
		                    Len: out Integer) is
   begin
      Len:= Integer(Sqrt(Float((A-AA)**2 +(B-BB)**2 +(C-CC)**2)) /100.0);
   end Length;
   
   
----Vinkely----	   
   procedure Vinkely(A, B, C, AA, BB, CC, Len: in Integer; Vy: out Integer) is
   begin
      if Len /= 0 then
	 Vy:= Omvandla(Arccos(Float(CC-C) /Float(Len*100)));
      else
	 Vy:= 999;
      end if;
   end Vinkely;
      
   
----Vinkelz----
   procedure Vinkelz(A, B, C, AA, BB, CC: in Integer; Vz: out Integer) is
   begin
      if AA-A = 0 and BB-B = 0 then
	 Vz:= 999;
      elsif AA-A = 0 and BB-B > 0 then
	 Vz:= 90;
      elsif AA-A = 0 and BB-B < 0 then
	 Vz:= 270;
      else
	 Vz:= Omvandla(Arccos(Float(AA-A) /Float(Sqrt(Float((AA-A)**2 +(BB-B)**2)))));
      end if;
      
      if AA-A < 0 and BB-B < 0 then
	 Vz:= Vz +90;
      elsif AA-A > 0 and BB-B < 0 then
	 Vz:= 360 -Vz;
      end if;
   end Vinkelz;   

begin
   Length(Xa, Ya, Za, Xb, Yb, Zb, L);
   Vinkely(Xa, Ya, Za, Xb, Yb, Zb, L, Vy);
   Vinkelz(Xa, Ya, Za, Xb, Yb, Zb, Vz); 
end Create_Vector_Data;
