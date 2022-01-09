with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;
with Ada.Sequential_IO;

procedure Erija971_ludkn080 is
   
   type Small_Array_Type is
     array(1..10) of Integer;
   
   type Person_Type is
      record
	 Efternamn, Fornamn, Gatuadress, Postadress: String(1..20);
	 Antal_Intressen: Integer;
	 Intressen: Small_Array_Type;
      end record;
   type Big_Array_Type is
     array(1..31) of Person_Type;
   
   type Interest_Array_Type is
     array(1..31) of Small_Array_Type;
   
   
   package Person_File_IO is
      new Ada.Sequential_IO(Person_Type);
   use Person_File_IO;
   
   
   procedure Empty_Array(Item: in out Small_Array_Type) is
   begin
      for I in 1..10 loop
	 Item(I):= 0;
      end loop;
   end Empty_Array;
   
   
   function Clear_Blancs(Item: in String) return Integer is
      Int: Integer;
   begin
      for I in reverse 1..20 loop
	 if Item(I) /= ' ' then
	    Int:= I;
	    return(Int);
	 end if;
      end loop;
      return 0;
   end Clear_Blancs;
   
      
   procedure Put(Item: in Person_Type; Match: in Small_Array_Type; File: Ada.Text_IO.File_Type) is
   begin
      Put(File, Item.Fornamn(1..Clear_Blancs(Item.Fornamn)));
      Put(File, " ");
      Put(File, Item.Efternamn(1..Clear_Blancs(Item.Efternamn)));
      Put(File, " ");
      Put(File, Item.Gatuadress(1..Clear_Blancs(Item.Gatuadress)));
      Put(File, " ");
      Put(File, Item.Postadress(1..Clear_Blancs(Item.Postadress)));
      Put(File, " *** Intressen:");
      for I in 1..10 loop
	 if Match(I) /= 0 then
	    Put(File, " ");
	    Put(File, Match(I), Width => 0);
	 end if;
      end loop;
      New_Line(File);
      Put(File, "-------------------------------------------------------------------------");
      New_Line(File);
   end Put;
   
   
   
   F1: Person_File_IO.File_Type;
   F2: Ada.Text_IO.File_Type;
   Source: Big_Array_Type;
   Interest_Match: Interest_Array_Type;
   Person: Person_Type;
   K, C: Integer:= 0;
   Count: Small_Array_Type;
   
   
begin
   Open(F1, In_File, "REG.BIN");
   Create(F2, Out_File, "RESULT.TXT");
   Put(F2, "-------------------------------------------------------------------------");
   New_Line(F2);
   
--------REG.BIN till source (array)--------
   while not End_Of_File(F1) loop
      for I in 1..31 loop
	 Empty_Array(Interest_Match(I));
	 Read(F1, Person);
	 Source(I):= Person;
      end loop;
   end loop;
   
--------Utskrift--------
   Put("Ange en följd av intressen 1 till 15, max 10 st. Avsluta med 0: ");
   Empty_Array(Count);
   Get(K);
   
   while K/= 0 loop
--------Counter--------
      if Count(10) /= 0 then
	 while K/= 0 loop
	    Get(K);
	 end loop;
	 exit;
      end if;
      
      for I in 1..10 loop
	 if Count(I) = 0 or Count(I) = K then
            Count(I) := K;
	    exit;
	 end if;
      end loop;
      
--------Matchar intressen--------
      for I in 1..31 loop
         for J in 1..Source(I).Antal_Intressen loop
	    if K = Source(I).Intressen(J) then
	       --Lägg till i Interest_match
	       	 for Q in 1..10 loop
	            if 0 = Interest_Match(I)(Q) or K = Interest_Match(I)(Q) then
	               Interest_Match(I)(Q):= K;
		       exit;
	            end if;
		 end loop;
	    end if;
	 end loop;
      end loop;
      Get(K);
   end loop;
   
--------Utskrift--------
   for I in 1..31 loop
      if Interest_Match(I)(1) /= 0 then
	 Put(Source(I), Interest_Match(I), F2);
      end if;
   end loop;
   
   New_Line;
   Put("KLART! Resultat på filen RESULT.TXT");
   
   Close(F1);
   Close(F2);
end Erija971_ludkn080;
