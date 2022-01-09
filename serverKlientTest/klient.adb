with Ada.Command_Line;    use Ada.Command_Line;
with Ada.Exceptions;      use Ada.Exceptions;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with TJa.Sockets;         use TJa.Sockets;

procedure Klient is
   
   --Socket_type anvÃ¤nds fÃ¶r att kunna kommunicera med en server
   Socket : Socket_Type;

   Text      : String(1..100); --AnvÃ¤nds fÃ¶r att ta emot text frÃ¥n anvÃ¤ndaren
   Textlangd : Natural;        --Kommer innehÃ¥lla lÃ¤ngden pÃ¥ denna text

begin
   --Denna rutin kontrollerar att programmet startas med tvÃ¥ parametrar.
   --Annars kastas ett fel.
   --Argumentet skall vara serverns adress och portnummer, t.ex.:
   --> klient localhost 3400
   if Argument_Count /= 2 then
      Raise_Exception(Constraint_Error'Identity,
                      "Usage: " & Command_Name & " remotehost remoteport");
   end if;

   -- Initierar en socket, detta krÃ¤vs fÃ¶r att kunna ansluta denna till
   -- servern.
   Initiate(Socket);

   -- Ansluter till servern
   Connect(Socket, Argument(1), Positive'Value(Argument(2)));

    
   loop
      
      --LÃ¤ser in en strÃ¤ng frÃ¥n anvÃ¤ndaren
      Get_Line(Text, Textlangd);
      if Textlangd=100 then Skip_Line; end if;
      New_Line;
      
      Put_Line(Socket, Text(1..Textlangd));
      
      --Och resultatet tas emot
      Get(Socket,Text(1..Textlangd));
      
      --och skrivs ut pÃ¥ skÃ¤rmen
      Put(Text(1..Textlangd));
      
   end loop;
   
   --Innan programmet avslutar stÃ¤ngs socketen, detta genererar ett exception
   --hos servern, pss kommer denna klient fÃ¥ ett exception nÃ¤r servern avslutas
   Close(Socket);



end Klient;
