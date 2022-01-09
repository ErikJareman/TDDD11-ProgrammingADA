with Ada.Command_Line;    use Ada.Command_Line;
with Ada.Exceptions;      use Ada.Exceptions;
with Ada.Text_IO;         use Ada.Text_IO;
with Resultatlista;       use Resultatlista;
with TJa.Sockets;         use TJa.Sockets;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure Server is

   Lyssnare  : Listener_Type;
   
   Socket1   : Socket_Type;
   Socket2   : Socket_Type;
   
   Text      : String(1 .. 100);
   Textlangd : Natural;
   Resultat  : Spelar_Array;
   Res       : Integer:= 0;
   Plats     : Integer:= 2;
  
  
begin
   if Argument_Count /= 1 then
      Raise_Exception(Constraint_Error'Identity,
                     "Usage: " & Command_Name & " port");
   end if;
   Initiate(Lyssnare, Natural'Value(Argument(1)), Localhost => False);

   Wait_For_Connection(Lyssnare, Socket1);
   Put_Line("Klient1 ansluten...");
   Wait_For_Connection(Lyssnare, Socket2);
   Put_Line("Klient2 ansluten...");
 

------------------------------Tilldela spelare------------------------------   
   
   Put_Line(Socket1, 1);
   Put_Line(Socket2, 2);
   Put("1, 2 -> klient 1");
 
   
------------------------------Spelet är igång------------------------------
   for I in 1..15 loop
      Put_Line(Socket1, Res);
      Put_Line(Socket1, Plats);
      Get(Socket1, Res);
      Get(Socket1, Plats);
      
      Put(Res);
      Put(' ');
      Put(Plats);
      New_Line;

      Put_Line(Socket2, Res);
      Put_Line(Socket2, Plats);
      Get(Socket2, Res);
      Get(Socket2, Plats);
   end loop;
   Put_Line(Socket1, Res);  --Kompenserar för dummy-resultat i början av loop
   Put_Line(Socket1, Plats);
  
exception
     
   when Constraint_Error =>
      Put_Line("Du matade inte in en parameter innehållande portnummer");
      
   when others =>
      Put_Line("Klienten krascha...");
      Close(Socket1);
      Close(Socket2);
end Server;
