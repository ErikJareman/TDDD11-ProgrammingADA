with Ada.Command_Line;      use Ada.Command_Line;
with Ada.Exceptions;        use Ada.Exceptions;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Resultatlista;         use Resultatlista;
with TJa.Sockets;           use TJa.Sockets;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Yatzy_Graphics;        use Yatzy_Graphics;
with Tja.Window.Elementary; use Tja.Window.Elementary;
with Tja.Keyboard;          use Tja.Keyboard;
with Tja.Misc;              use Tja.Misc;with Ada.Text_IO;                 use Ada.Text_IO;
with Yatzy_Graphics;              use Yatzy_Graphics;
with TJa.Window.Elementary;         use TJa.Window.Elementary;
with TJa.Window.Text;               use TJa.Window.Text;
with TJa.Window.Graphic;            use TJa.Window.Graphic;
with Ada.Text_IO;                   use Ada.Text_IO;

with Ada.Strings.Unbounded;         use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;




--gnatmake $(/courses/TDDD11/TJa/bin/tja_config) testprogram.adb

procedure Testprogram is
   
   Res: Integer:= 2;
   Plats: Integer:= 12;
   Dice_Array : array(1..5) of Integer;
   
begin
   Generate_Board;
   
   Set_Background_Colour(BLACK);
   Set_Foreground_Colour(Green);
   Goto_XY(47, Plats+9);
   Put(Horisontal_Line, 3);
   if Res < 10 then
      Goto_XY(48, Plats+9);
   else
      Goto_XY(47, Plats+9);
   end if;
   Put(Res, Width => 0);
   
   for I in 1..5 loop
      Shuffle(Dice_Array(I));
      Dice_Draw(Dice_Array(I) , I);
   end loop;
   
   
   
   
   
   Goto_XY(1, 90);
   Reset_Colours;
   Reset_Text_Modes;
   
end Testprogram;



