with Ada.Text_IO;                     use Ada.Text_IO;
with Ada.Integer_Text_IO;             use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;               use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random;

procedure Main is

   type Table_Type is 
      record
         Spelare: String(1..20);
	 
         One, Two, Three, Four, Five, Six, Bonus, 
         Pair, Two_Pair, Tripple, Quads, Full_House, 
         Small_Straight, Big_Straight, Chance, Yatzy,
         Total_Sum: Integer:= 0;
   end record;
   
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
	 Item.Bonus:= 100;
      end if;
      
   end Bonus;

   T: Table_Type;

begin
   
   T.One:= 20;
   T.Four:= 42;
   Bonus(T);
   Put(T.Bonus, Width => 0);
   
end Main;
