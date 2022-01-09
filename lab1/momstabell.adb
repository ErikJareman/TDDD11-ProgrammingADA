with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Momstabell is
   
   First, Last, Steg, Moms: Float := -1.0;
   Laps: Integer;
   
begin
   
   Put("Första pris: ");
   Get(First);
   Put("Sista pris: ");
   Get(Last);
   Put("Steg: ");
   Get(Steg);
   Put("Momsprocent: ");
   Get(Moms);
   New_Line;
   
   while First < Float(0) loop
     Put("Felaktig inmatning...");
     New_Line;
     Put("Första pris: ");
     Get(First);
     New_Line;
   end loop;

   while Last < First loop
     Put("Felaktig inmatning...");
     New_Line;
     Put("Sista pris: ");
     Get(Last);
     New_Line;
   end loop;

   while Steg <= Float(0) loop
     Put("Felaktig inmatning...");
     New_Line;
     Put("Steg: ");
     Get(Steg);
     New_Line;
   end loop;

   while Moms < Float(0) or Moms > Float(100) loop
     Put("Felaktig inmatning...");
     New_Line;
     Put("Momsprocent ");
     Get(Moms);
     New_Line;
   end loop;
   
   
   if Steg = Float(0) then                        -- Bestämmer "antal varv"
      Laps := 1;
      Steg := Last - First;
   else
      Laps := Integer((Last-First)/Steg);
   end if;
   
   
   Put("=== Momstabell ===");                     -- Skriver ut tabell
   New_Line;
   Put("Pris utan moms   Moms   Pris med moms");
   New_Line;
   
   for I in 0..Laps loop
      if First > Last then
	 exit;
      end if;
      Put(First, Fore => 5, Aft => 2, Exp => 0);
      Put(Moms*First*0.01, Fore => 10, Aft => 2, Exp =>0);
      Put(Moms*First*0.01 + First, Fore => 8, Aft => 2, Exp => 0);
      First := First + Steg;
      New_Line;
   end loop;
   
   
end Momstabell;
