package body Person_Handling is
   
   procedure Get(Item : out Person_Type) is
      S: String(1..20);
      L: Natural;
   begin
      New_Line;
      Put("Namn: ");
      Get_Line(S,L);
      Item.Name:= S;
      Item.Name_Length:= L;
      
      Put("Adress: ");
      Get_Line(S,L);
      Item.Address:= S;
      Item.Address_Length:= L;
      
      Put("Födelsedatum: ");
      Get(Item.Birth_Date);
      Skip_Line;
   end Get;
   
   procedure Put(Item : in Person_Type) is
   begin
      New_Line;
      Put("----------Personinformation----------");
      New_Line;
      Put("Namn: ");
      Put(Item.Name(1..Item.Name_Length));
      New_Line;
      Put("Adress: ");
      Put(Item.Address(1..Item.Address_Length));
      New_Line;
      Put("Födelsedatum: ");
      Put(Item.Birth_Date);
      New_Line;
   end Put;
   
   function Get_Birth_Date(Item : in Person_Type) return Date_Type is
   begin
      return Item.Birth_Date;
   end Get_Birth_Date;
   
end Person_Handling;

