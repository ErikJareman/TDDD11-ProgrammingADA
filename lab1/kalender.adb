with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;

procedure Kalender is
   
   First: Integer;
   Total: Integer;
   
begin
   
   Put("Ange veckodagsnummer för den första dagen i månaden: ");
   Get(First);
   Put("Ange antalet dagar i månaden: ");
   Get(Antal);
   
   while First not in (1..7) loop
      New_Line;
      Put("Felaktig inmatning...");
      New_Line;
      Put("Ange veckodagsnummer för den första dagen i månaden: ");
      Get(First);
   end loop;
   
   while Antal != 28 and Antal
      
       
   
   
   
end;
