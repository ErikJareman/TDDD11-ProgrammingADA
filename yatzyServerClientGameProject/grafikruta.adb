with TJa.Window.Graphic;       use TJa.Window.Graphic;
with TJa.Window.Elementary;    use TJa.Window.Elementary;
with TJa.Window.Text;          use TJa.Window.Text;
with Ada.Text_IO;              use Ada.Text_IO;
with Ada.Numerics;
with  Ada.Numerics.Discrete_Random;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
use type Ada.Real_Time.Time; 
use type Ada.Real_Time.Time_Span;
   
package body Grafikruta is
   
    function  Generate_One_To_Ten return Integer is
      subtype One_To_Ten is Integer range 1..9;
      Package One_To_Ten_Random is
	 new Ada.Numerics.Discrete_Random(Result_Subtype => One_To_Ten);
      G: One_To_Ten_Random.Generator;

   begin -- Generate ONE TO TEN
      One_To_Ten_Random.Reset(G);
      

      return (One_To_Ten_Random.Random(G));
    
   end Generate_One_To_Ten;
   
   procedure Blackwindow is
      
   begin
      Set_background_Colour(black);
      for D in 1..37 loop
	 for I in 1..56 loop

	    Goto_XY(I+2, D+2);
	    Put(" ");

	 end loop;
      end loop;
   end Blackwindow;
   
   procedure Greenboarders is
      
   begin
      Set_background_Colour(green);

      for I in 1..37 loop
	 Goto_XY(3, I+2); 
	 Put("  ");
	 Goto_XY(58, I+2);
	 Put("  ");
      end loop;

      for I in 1..57 loop
	 Goto_XY(I+2,39);
	 Put(" ");
	 Goto_XY(I+2, 2);
	 Put(" ");
      end loop;
      
   end Greenboarders;
   
   
   procedure Bigthree is
      
   begin
      Set_Background_Colour(Black);
      Set_Foreground_Colour(Green);
      
      for I in 1..30 loop
	 for D in 1..6 loop
	    Goto_XY(I+14, D +5);
	    Put("3");
	 end loop;
      end loop;
      
      for I in 1..8 loop
	 for D in 1..24 loop
	    Goto_XY(I+36, D+11);
	    Put("3");
	 end loop;
      end loop;
      
      for I in 1..30 loop
	 for D in 1..6 loop
	    Goto_XY(I+14, D+18);
	    Put("3");
	 end loop;
      end loop;
      
      for I in 1..30 loop
	 for D in 1..6 loop
	    Goto_XY(I+14, D+29);
	    Put("3");
	 end loop;
      end loop;
      
   end Bigthree;
   
   procedure Bigtwo is
      
   begin
      Set_Background_Colour(Black);
      Set_Foreground_Colour(Green);
      
      
      for I in 1..30 loop
	 for D in 1..6 loop
	    Goto_XY(I+14, D +5);
	    Put("2");
	 end loop;
      end loop;
      
      for I in 1..8 loop
	 for D in 1..6 loop
	    Goto_XY(I+36,D+11);
	    Put("2");
	 end loop;
      end loop;
      
      for I in 1..30 loop
	 for D in 1..6 loop
	    Goto_XY(I+14,D+17);
	    Put("2");
	 end loop;
      end loop;
      
      for I in 1..8 loop
	 for D in 1..6 loop
	    Goto_XY(I+14,D+23);
	    Put("2");
	 end loop;
      end loop;
      
      for I in 1..30 loop
	 for D in 1..6 loop
	    Goto_XY(I+14,D+29);
	    Put("2");
	 end loop;
      end loop;   
      
   end Bigtwo;
   
   procedure BigOne is
      
   begin
      
    Set_Background_Colour(Black);
    Set_Foreground_Colour(Green);  
    
    for I in 1..22 loop
	 for D in 1..6 loop
	    Goto_XY(I+14, D +5);
	    Put("1");
	 end loop;
    end loop;   
    
    for I in 1..8 loop
       for D in 1..24 loop
	  Goto_XY(I+28,D+5);
	  Put("1");
       end loop;
    end loop;
    
     for I in 1..30 loop
	 for D in 1..6 loop
	    Goto_XY(I+14,D+29);
	    Put("1");
	 end loop;
      end loop;   
    
   end BigOne;
   
   procedure Blackcenter is
   
   begin
  
      
       for I in 1..33 loop
      for D in 1..12 loop
	 Goto_XY(14+I,13+D);
	 Set_Background_Colour(Black);
	 Put(" ");
	 
      end loop;
       end loop;
       
       end Blackcenter;
   
   procedure CenterBox is
      
   begin
      
      Set_Background_Colour(Black);
      Set_Foreground_Colour(Green);
      
     Blackcenter;
      
        -- ÖVERLINJE --
   
   Set_Underlined_Mode(Off);
   Goto_XY(15,13);
   Put(Upper_Left_Corner);
   Goto_XY(16,13);
   for I in 1..31 loop
      Put(Horisontal_Line);
   end loop;
   Goto_XY(47,13);
   Put(Upper_Right_Corner);
   
   -- UNDERLINJE --
  
   Goto_XY(15,26);
   Put(Lower_Left_Corner);
   for I in 1..31 loop
      Put(Horisontal_Line);
   end loop;
   Goto_XY(47,26);
   Put(Lower_Right_Corner);

   -- SIDOLINJER --
   
   Set_Underlined_Mode(Off);
   for I in 1..12 loop
      Goto_XY(15,13+I);
      Put(Vertical_Line);
      Goto_XY(47,13+I);
      Put(Vertical_Line);
   end loop;
   
   --- SKRIFT I MITTEN --
   
   Set_Bold_Mode(On);
   Goto_XY(24, 16);
   Put("HAJ ÄGEN PLAYER,");
   
   Goto_XY(20,18);
   Put("WELCOME TO MATRIX JATSY!");
   
   Set_Underlined_Mode(On);
   Goto_XY(20,24);
   Put("press ENTER to continue..");
   
   -- ENTERTECKEN --
   
   Set_Underlined_Mode(Off);
   Goto_XY(30,19);
   Put(Upper_Left_Corner);
   Goto_XY(31,19);
   Put(Horisontal_Line, times => 4);
   Goto_XY(35,19);
   Put(Upper_Right_Corner);
   Goto_XY(30,20);
   Put(Vertical_Line);
   Goto_XY(35,20);
   Put(Vertical_Line);
   GOTO_Xy(35,21);
   PUT(VERTICAL_LINE);
   Goto_XY(35,22);
   Put(Vertical_Line);
   Goto_XY(35,23);
   Put(Lower_Right_Corner);
   Goto_XY(27,23);
   Put(Horisontal_Line, Times => 8);
   Goto_XY(26,23);
   Put(Lower_Left_Corner);
   Goto_XY(26,22);
   Put(Vertical_Line);
   Goto_XY(26,21);
   Put(Upper_Left_Corner);
   Goto_XY(27,21);
   Put(Horisontal_Line, Times => 4);
   Goto_XY(30,21);
   Put(Lower_Right_Corner);
   
   Goto_XY(27,22);
   Put("Enter <");
   Goto_XY(34,22);
   Put(Lower_Right_Corner);
   
  end Centerbox;
  
  
  procedure Names is
     
  begin
     Set_Background_Colour(Black);
      Set_Foreground_Colour(Green);
     
      Set_Bold_Mode(on);
   Goto_XY(34,9);
   Put("MATRIX");
   
   Goto_XY(6,11);
   Put("JATSY");
   
   Goto_XY(49,22);
   Put("MATRIX");
 
   Goto_XY(27,4);
   Put("JATSY");
   
   Goto_XY(38,33);
   Put("MATRIX");
   
   Goto_XY(10,37);
   Put("JATSY");
   
   Goto_XY(8,28);
   Put("MATRIX");
   
   Goto_XY(35,38);
   Put("ETT SPEL I VÄRLDSKLASS!");
   
   GOTO_XY(9,3);
   PUT("KNAST");
   
   GOTO_XY(6,18);
   PUT("KRONVALL");
   
   GOTO_XY(40,29);
   PUT("ALSTERYD");
   
   GOTO_XY(45,8);
   PUT("JAREMAN");
   
   GOTO_XY(11,31);
   PUT("JOHANSSON"); 
   
   GOTO_XY(1,50);
   
    end Names;
  
  procedure Names_Delay is
     
     begin
   Set_Background_Colour(Black);
   Set_Foreground_Colour(Green);
   Set_Bold_Mode(on);
   
   Goto_XY(34,9);
   Put("MATRIX");
   delay 0.4;
   
   Goto_XY(6,11);
   Put("JATSY");
    delay 0.4;
   
   Goto_XY(49,22);
   Put("MATRIX");
    delay 0.4;
 
   Goto_XY(27,4);
   Put("JATSY");
    delay 0.4;
   
   Goto_XY(38,33);
   Put("MATRIX");
   delay 0.4;
   
   Goto_XY(10,37);
   Put("JATSY");
    delay 0.4;
   
   Goto_XY(8,28);
   Put("MATRIX");
   delay 0.4;
   
   Goto_XY(35,38);
   Put("ETT SPEL I VÄRLDSKLASS!");
   delay 0.4;
   
   GOTO_XY(9,3);
   PUT("KNAST");
   delay 0.4;
   
   GOTO_XY(6,18);
   PUT("KRONVALL");
   delay 0.4;
   
   GOTO_XY(40,29);
   PUT("ALSTERYD");
   delay 0.4;
   
   GOTO_XY(45,8);
   PUT("JAREMAN");
   delay 0.4;
   
   GOTO_XY(11,31);
   PUT("JOHANSSON");
   GOTO_XY(1,50);
   
   end Names_Delay;
   
  procedure Matrixpattern is
  O: Integer;   
  begin
      Set_Background_Colour(Black);
      Set_Foreground_Colour(Green);
      
       Set_Bold_Mode(Off);
   
   for I in 1..53 loop
      for D in 1..10 loop 
	 Goto_XY(I+4, D+2);
	 O:= Generate_One_To_Ten;
	 Put(O, 1);
      end loop;
      end loop;
     
   
   for I in 1..53 loop
      for D in 1..12 loop 
	 Goto_XY(I+4, D+26);
	 O:= Generate_One_To_Ten;
	 Put(O, 1);
      end loop;
   end loop;
   
    for I in 1..10 loop
       for D in 1..14 loop 
	 Goto_XY(I+4, D+12);
	 O:= Generate_One_To_Ten;
	 Put(O, 1);
      end loop;
    end loop;
    
    for I in 1..10 loop
      for D in 1..14 loop 
	 Goto_XY(I+47, D+12);
	 O:= Generate_One_To_Ten;
	 Put(O, 1);
      end loop;
    end loop;
    
   Names;   
   
   
  end Matrixpattern;
  
  procedure Numberrain is
     O,P,U: Integer;  
  begin
     
     Set_Background_Colour(Black);
     Set_Foreground_Colour(Green);
     
     
     

     for D in 1..34 loop
	Goto_XY(10,D+2);
	Set_Bold_Mode(On);
	Put("MATRIX JATSY");
	GOTO_Xy(10,D+2);
	delay 0.02;
	Put("            ");
	
	delay 0.02;
	Goto_XY(30,D+2);
	Set_Bold_Mode(On);
	Put("MATRIX JATSY");
	GOTO_Xy(30,D+2);
	delay 0.02;
	Put("            ");
     end loop;
     
     
     end Numberrain;
   
   end Grafikruta;
