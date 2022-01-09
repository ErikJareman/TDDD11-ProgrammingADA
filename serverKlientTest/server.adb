with Ada.Command_Line;    use Ada.Command_Line;
with Ada.Exceptions;      use Ada.Exceptions;
with Ada.Text_IO;         use Ada.Text_IO;

with TJa.Sockets;         use TJa.Sockets;

procedure Server is

   --| Servern behÃ¶ver en Listener_type fÃ¶r att ta emot inkommande anslutningar
   Lyssnare  : Listener_Type;
   
   --| Socket_type anvÃ¤nds fÃ¶r att kunna kommunicera med en klient
   Socket1, Socket2    : Socket_Type;
   
   Text      : String(1 .. 100); --| AnvÃ¤nds fÃ¶r att ta emot text
   Textlangd : Natural;          --| Kommer innehÃ¥lla lÃ¤ngden pÃ¥ denna text
  
   
begin
   --| Denna rutin kontrollerar att programmet startas med en parameter.
   --| Annars kastas ett fel.
   --| Argumentet skall vara portnummret, programmet kan t.ex. startas med:
   --| > server 3400
   if Argument_Count /= 1 then
      Raise_Exception(Constraint_Error'Identity,
                      "Usage: " & Command_Name & " port");
   end if;

   --| Initierar lyssnaren pÃ¥ en port (klienter bara utanfÃ¶r "localhost").\
   Initiate(Lyssnare, Natural'Value(Argument(1)), Localhost => False);
   
   --| *** eller ***
   --| Initierar lyssnaren pÃ¥ en port (klienter bara pÃ¥ "localhost").
   --Initiate(Lyssnare, Natural'Value(Argument(1)), Localhost => True);
   
   --| VÃ¤ntar tills en anslutning bildas, krÃ¤vs att en klient kÃ¶r connect
   Wait_For_Connection(Lyssnare, Socket1);

   --| Nu har en anslutning skapats och vi kan dÃ¥ bÃ¶rja en loop eller nÃ¥got
   Put_Line("Klient ansluten...Du börjar skriva");
   
   
   
   
   --| Initierar lyssnaren pÃ¥ en port (klienter bara utanfÃ¶r "localhost").\
   Initiate(Lyssnare, Natural'Value(Argument(1)), Localhost => False);
   
   --| *** eller ***
   --| Initierar lyssnaren pÃ¥ en port (klienter bara pÃ¥ "localhost").
   --Initiate(Lyssnare, Natural'Value(Argument(1)), Localhost => True);
   
   --| VÃ¤ntar tills en anslutning bildas, krÃ¤vs att en klient kÃ¶r connect
   Wait_For_Connection(Lyssnare, Socket2);

   --| Nu har en anslutning skapats och vi kan dÃ¥ bÃ¶rja en loop eller nÃ¥got
   Put_Line("Klient ansluten...");
   
   Get_Line(Socket2, Text, Textlangd);
   
   loop
      --| VÃ¤ntar pÃ¥ en strÃ¤ng frÃ¥n klienten
      Get_Line(Socket1, Text, Textlangd);
      
      
      --| Skickar resultatet tillbaka
      Put_Line(Socket2, Text(1..Textlangd));
      
      
      --| VÃ¤ntar pÃ¥ en strÃ¤ng frÃ¥n klienten
      Get_Line(Socket2, Text, Textlangd);
      
      
      --| Skickar resultatet tillbaka
      Put_Line(Socket1, Text(1..Textlangd));
          
      
   end loop;
   
exception
   --| Lite felhantering       
   when Constraint_Error =>
      Put_Line("Du matade inte in en parameter innehÃ¥llande portnummer");
      
   when others => --| kanske end_error eller socket_error, det betyder att
		  --| klienten stÃ¤ngt sin socket. DÃ¥ skall den stÃ¤ngas Ã¤ven
		  --| hÃ¤r.
      Put_Line("Nu dog klienten");
      Close(Socket1);
      Close(Socket2);
end Server;
