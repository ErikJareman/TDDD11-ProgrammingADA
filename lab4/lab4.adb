with Ada.Text_IO;          use Ada.Text_IO;
with Date_Handling;        use Date_Handling;

procedure Lab4 is
   Date: Date_Type;
   
begin
   loop
      begin
	 Put("Ange ett datum: ");
         Get(Date);
         exit;
      exception
	 when Year_Error =>
	    Put("Year_Error - Försök igen...");
         when Month_Error =>
            Put("Month_Error - Försök igen...");
	 when Day_Error =>
	    Put("Day_Error - Försök igen...");
	 when Format_Error =>
	    Put("Format_Error - Försök igen..."); 
      end;
      New_Line;
      Skip_Line;
   end loop;

   Put("Ett datum: ");
   Put(Date);
end Lab4;
