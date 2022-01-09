with Ada.Text_IO;         use Ada.Text_IO;
with Person_Handling;     use Person_Handling;
with Person_Sorted_List;  use Person_Sorted_List;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Date_Handling;       use Date_Handling;

procedure Main is
   Person: Person_Type;
   List : List_Type;
begin
   Get(Person);
   Insert(Person, List);
   Get(Person);
   Insert(Person, List);
   Get(Person);
   Insert(Person, List);
   Put(List);
end Main;
