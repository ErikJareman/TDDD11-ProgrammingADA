with Ada.Text_IO;                     use Ada.Text_IO;
with Ada.Integer_Text_IO;             use Ada.Integer_Text_IO;
with Ada.Numerics.Float_Random;

procedure Main is

   procedure Shuffle(Dice: in out Integer) is
   
      G: Ada.Numeics.Float_Random.Generator;
      X: Float;
   
   begin
   
      Ada.Numerics.Float_Random.Reset(G);
      X:= Ada.Numerics.Float_Random(G);
      Put(X, Fore => 1, Aft => 2, Exp => 0);
      Dice:= Integer(X);
   
   end Suffle;
   
   I: Integer;

begin
   
   Shuffle(I);
   
end Main;
