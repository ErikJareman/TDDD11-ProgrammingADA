with TJa.Window.Elementary;         use TJa.Window.Elementary;
with TJa.Window.Text;               use TJa.Window.Text;
with TJa.Window.Graphic;            use TJa.Window.Graphic;
with Ada.Text_IO;                   use Ada.Text_IO;

with Ada.Strings.Unbounded;         use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

--gnatmake $(/courses/TDDD11/TJa/bin/tja_config) yatzy_graphics.adb

package body Yatzy_Graphics is   
   
  
   procedure Dice_Shell(X, Y: in Integer) is
      
   begin
      Set_Background_Colour(BLACK);
      Set_Foreground_Colour(GREEN);
      Goto_XY(X, Y);
      Put(Upper_Left_Corner);
      Put(Horisontal_Line, Times => 2);
      Put("[  ]");
      Put(Horisontal_Line, Times => 2);
      Put(Upper_Right_Corner);
      for I in 1..3 loop
	 Goto_XY(X, Y+I);
	 Put(Vertical_Line);
	 Goto_XY(X+9, Y+I);
	 Put(Vertical_Line);
      end loop;
      Goto_XY(X, Y+4);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line, Times => 8);
      Put(Lower_Right_Corner);
      Reset_Colours;
      Reset_Text_Modes;
   end Dice_Shell;
   
   
   procedure Dice_Draw(Number, Position: in Integer) is
   begin
      Set_Graphical_Mode(ON);
      Set_Background_Colour(BLACK);
      Set_Foreground_Colour(GREEN);
      if Number = 0 then
	 for I in 1..3 loop
	    Goto_XY(6+11*(Position-1), 30+(I-1));
	    Put("        ");
	 end loop;
      elsif Number = 1 then
	 Goto_XY(9+11*(Position-1), 31);
	 Put("()");
      elsif Number = 2 then
	 Goto_XY(7+11*(Position-1), 32);
	 Put("()");
	 Goto_XY(11+11*(Position-1), 30);
	 Put("()");
      elsif Number = 3 then
	 Goto_XY(9+11*(Position-1), 31);
	 Put("()");
	 Goto_XY(7+11*(Position-1), 32);
	 Put("()");
	 Goto_XY(11+11*(Position-1), 30);
	 Put("()");
      elsif Number = 4 then
	 Goto_XY(7+11*(Position-1), 32);
	 Put("()");
	 Goto_XY(11+11*(Position-1), 30);
	 Put("()");
	 Goto_XY(7+11*(Position-1), 30);
	 Put("()");
	 Goto_XY(11+11*(Position-1), 32);
	 Put("()");
      elsif Number = 5 then
	 Goto_XY(9+11*(Position-1), 31);
	 Put("()");	 
	 Goto_XY(7+11*(Position-1), 32);
	 Put("()");
	 Goto_XY(11+11*(Position-1), 30);
	 Put("()");
	 Goto_XY(7+11*(Position-1), 30);
	 Put("()");
	 Goto_XY(11+11*(Position-1), 32);
	 Put("()");
      elsif Number = 6 then
	 Goto_XY(7+11*(Position-1), 32);
	 Put("()");
	 Goto_XY(11+11*(Position-1), 30);
	 Put("()");
	 Goto_XY(7+11*(Position-1), 30);
	 Put("()");
	 Goto_XY(11+11*(Position-1), 32);
	 Put("()");
	 Goto_XY(7+11*(Position-1), 31);
	 Put("()");
	 Goto_XY(11+11*(Position-1), 31);
	 Put("()");	 
      end if;
      
      Set_Graphical_Mode(Off);
      Reset_Colours;
      Reset_Text_Modes;
      Goto_XY(1, 41);
   end Dice_Draw;
   
   
   procedure Game_Info(Item: in Integer) is
      
   begin
      Goto_XY(8, 37);
      Set_Background_Colour(GREEN);
      Set_Foreground_Colour(BLACK);
      for I in 1..48 loop
	 Put(" ");
      end loop;
      Goto_XY(9, 37);
      Put("Info:");
      Goto_XY(15, 37);
      
      if Item = 1 then
	 Put("Det är motståndarens tur...");
      elsif Item = 2 then
	 Put("Din tur! Blanda tärningarna!");
      elsif Item = 3 then
	 Put("Välj tärningar att spara! Blanda sedan...");
      elsif Item = 4 then
	 Put("Välj resultat...");
      elsif Item = 5 then
	 Put("Du Förlorade. Gå hem och skäms.");
      elsif Item = 6 then
	 Put("Grattis! Du vann!");
      end if;
      
      
      Reset_Colours;
      Reset_Text_Modes;
      
   end Game_Info;
   
   
   
   procedure Generate_Board is
      
      Board_Width : Integer:= 58;
      Board_Height: Integer:= 38;
      Kolonn      : Integer:= 8;
      
      type Hands_Array_Type is array(1..18) of Unbounded_String;
      Hands_Source: Hands_Array_Type;
      
      
      
   begin
      Reset_Colours;
      Clear_Window;
      Set_Background_Colour(BLACK);
      Set_Foreground_Colour(GREEN);
      
      for I in 2..Board_Height loop          --Bakgrundsfärg
	 Goto_XY(3, I);
	 for J in 1..Board_Width loop
	    Put(" ");
	 end loop;
      end loop;
      
      Goto_xy(Kolonn+16, 9);                    --"spelarrad"
      Put(Upper_Left_Corner);
      Put(Horisontal_Line, Times => 15);
      Put(Horisontal_Down);
      Put(Horisontal_Line, Times => 15);
      Put(Upper_Right_Corner);
      
      
      Goto_XY(Kolonn, 10);                    --Övre tabellrad
      Put(Upper_Left_Corner);
      for I in 1..2 loop
	 Put(Horisontal_Line, Times => 6);
	 Put("[");
	 Put(" ");
	 Put("]");
	 Put(Horisontal_Line, 6);
	 Put(Cross);
      end loop;
      Put(Horisontal_Line, Times => 6);
      Put("---");
      Put(Horisontal_Line, 6);
      Put(Vertical_Left);
      
      for I in 1..16 loop                    --Tabellrader
	 Goto_XY(Kolonn, I+10);
	 Put(Vertical_Right);
	 for J in 1..2 loop
	    Put(Horisontal_Line, Times => 6);
	    Put("[");
	    Put(" ");
	    Put("]");
	    Put(Horisontal_Line, 6);
	    Put(Cross);
	 end loop;
	 Put(Horisontal_Line, Times => 6);
	 Put("---");
	 Put(Horisontal_Line, 6);
	 Put(Vertical_Left);
      end loop;
      
      Goto_XY(Kolonn, 27);                   --Undre tabellrad
      Put(Lower_Left_Corner);
      for I in 1..2 loop
	 Put(Horisontal_Line, Times => 6);
	 Put("[");
	 Put(" ");
	 Put("]");
	 Put(Horisontal_Line, 6);
	 Put(Horisontal_UP);
      end loop;
      Put(Horisontal_Line, Times => 6);
      Put("---");
      Put(Horisontal_Line, 6);
      Put(Lower_Right_Corner);
      
      Goto_XY(31 ,27);
      Put("---");
      Goto_XY(31, 16);
      Put("---");
      Goto_XY(31, 17);
      Put("---");
      
      
      --Utskrift Text i tabell
      Hands_Source:= (To_Unbounded_String("Ettor"),To_Unbounded_String("Tvåor"), To_Unbounded_String("Treor"), To_Unbounded_String("Fyror"), To_Unbounded_String("Femmor"), To_Unbounded_String("Sexor"), To_Unbounded_String("Summa"),To_Unbounded_String("Bonus"), To_Unbounded_String("1-par"), To_Unbounded_String("2-par"), To_Unbounded_String("Tretal"), To_Unbounded_String("Fyrtal"), To_Unbounded_String("Liten"), To_Unbounded_String("Stor"), To_Unbounded_String("Kåk"), To_Unbounded_String("Chans"), To_Unbounded_String("YATZY"), To_Unbounded_String("Total"));
      for I in 1..18 loop
	 Goto_XY((10+(14-Length(Hands_Source(I)))/2), I+9);
	 Put(Hands_Source(I));
      end loop;
      Goto_XY(Kolonn+21, 9);
      Put("Spelare");
      Goto_XY(Kolonn+35, 9);
      Put("Motståndare");
      
      
      --Skapa tärningar (skal)
      for I in 1..5 loop
	 Dice_Shell(5+11*(I-1), 29);
      end loop;
      
      
      --Skapa Info-ruta
      Goto_XY(8, 37);
      Set_Background_Colour(GREEN);
      Set_Foreground_Colour(BLACK);
      for I in 1..48 loop
	 Put(" ");
      end loop;
      Goto_XY(9, 37);
      Put("Info:");
      Reset_Colours;
      Reset_Text_Modes;
      
      
      --Skapa "knappar"
      Set_Background_Colour(Black);
      Set_Foreground_Colour(Green);
      Goto_XY(15, 35);
      Put("Blanda[Enter]");
      Goto_XY(35, 35);
      Put("Markera[Space]");
     
      --Lägg till "markera med space"
      
      
      --------------------------------------------------------------------------------
      
      --Skapa titeltext (YATZY)
      Set_Background_Colour(BLACK);
      Set_Foreground_Colour(GREEN);
      Goto_XY(9, 3);                                    --Skriver ut J
      Put(Upper_Left_Corner);
      Put(Horisontal_Line, Times => 4);
      Put(Upper_Right_Corner);
      Goto_XY(9, 4);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line, Times => 2);
      Put(Upper_Right_Corner);
      Put(" ");
      Put(Vertical_Line);
      Goto_XY(8, 5);
      Put(Upper_Left_Corner);
      Put(Horisontal_line);
      Put(Upper_Right_Corner);
      Put(" ");
      Put(Vertical_Line);
      Put(" ");
      Put(Vertical_Line);
      Goto_XY(8, 6);
      Put(Vertical_Line);
      Put(" ");
      Put(Lower_Left_Corner);
      Put(Horisontal_Line, Times => 1);
      Put(Lower_Right_Corner);
      Put(" ");
      Put(Vertical_Line);
      Goto_XY(8, 7);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line, Times => 5);
      Put(Lower_Right_Corner);
      
      Goto_XY(19, 3);                                  --Skriver ut A
      Put(Upper_Left_Corner);
      Put(Horisontal_Line, 5);
      Put(Upper_Right_Corner);
      Goto_XY(19, 4);
      Put(Vertical_Line);
      Goto_XY(21, 4);
      Put(Upper_Left_Corner);
      Put(Horisontal_Line);
      Put(Upper_Right_Corner);
      Put(" ");
      Put(Vertical_Line);
      Goto_XY(19, 5);
      Put(Vertical_Line);
      Goto_XY(21, 5);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line);
      Put(Lower_Right_Corner);
      Goto_XY(25, 5);
      Put(Vertical_Line);
      Goto_XY(19, 6);
      Put(Vertical_Line);
      Goto_XY(21, 6);
      Put(Upper_Left_Corner);
      Put(Horisontal_Line);
      Put(Upper_Right_Corner);
      Goto_XY(25, 6);
      Put(Vertical_Line);   
      Goto_XY(19, 7);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line);
      Put(Lower_Right_Corner);
      Goto_XY(23, 7);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line);
      Put(Lower_Right_Corner);
      
      
      Goto_XY(29, 3);                                 --Skriver ut T
      Put(Upper_Left_Corner);
      Put(Horisontal_Line, Times => 5);
      Put(Upper_Right_Corner);
      Goto_XY(29, 4);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line, Times => 1);
      Put(Upper_Right_Corner);
      Put(" ");
      Put(Upper_Left_Corner);
      Put(Horisontal_Line, Times => 1);
      Put(Lower_Right_Corner);
      for I in 1..2 loop
	 Goto_XY(31, 5+(I-1));
	 Put(Vertical_Line);
	 Put(" ");
	 Put(Vertical_Line);
      end loop;
      Goto_XY(31, 7);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line);
      Put(Lower_Right_Corner);
      
      Goto_XY(39, 3);                                --Skriver ut S
      Put(Upper_Left_Corner);
      Put(Horisontal_Line, Times => 5);
      Put(Upper_Right_Corner);
      Goto_XY(39, 4);
      Put(Vertical_Line);
      Put(" ");
      Put(Upper_Left_Corner);
      Put(Horisontal_Line, Times => 3);
      Put(Lower_Right_Corner);
      Goto_XY(39, 5);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line);
      Put(Horisontal_UP);
      Put(Horisontal_Line);
      Put(Horisontal_Down);
      Put(Horisontal_Line);
      Put(Upper_Right_Corner);
      Goto_XY(39, 6);
      Put(Upper_Left_Corner);
      Put(Horisontal_Line, Times => 3);
      Put(Lower_Right_Corner);
      Put(" ");
      Put(Vertical_Line);
      Goto_XY(39, 7);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line, Times => 5);
      Put(Lower_right_Corner);
      
      
      Goto_XY(49, 3);                                 --Skriver ut Y
      Put(Upper_Left_Corner);
      Put(Horisontal_Line);
      Put(Upper_Right_Corner);
      Goto_XY(53, 3);
      Put(Upper_Left_Corner);
      Put(Horisontal_Line);
      Put(Upper_Right_Corner);
      Goto_XY(49, 4);
      Put(Vertical_Line);
      Goto_XY(51, 4);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line);
      Put(Lower_Right_Corner);
      Goto_XY(55, 4);
      Put(Vertical_Line);
      Goto_XY(49, 5);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line);
      Put(Upper_Right_Corner);
      Goto_XY(53, 5);
      Put(Upper_Left_Corner);
      Put(Horisontal_Line);
      Put(Lower_Right_Corner);
      Goto_XY(51, 6);
      Put(Vertical_Line);
      Goto_XY(53, 6);
      Put(Vertical_Line);
      Goto_XY(51, 7);
      Put(Lower_Left_Corner);
      Put(Horisontal_Line);
      Put(Lower_Right_Corner);
      -------------------------------------------------------------------
      
      Reset_Colours;
      Reset_Text_Modes;
      
      --Set_Graphical_Mode(Off);
      Goto_XY(1, Board_Height+4);
   end Generate_board;
   
end Yatzy_Graphics;
