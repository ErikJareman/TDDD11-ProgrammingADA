with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;

package body Date_Handling is

  -----------------------------------------------------------------------------
  --| Modulnamn      : Leap_Year
  --| Beskrivning    : Kontrollerar om ett �rtal �r ett skott�r. Skott�r g�ller
  --|                  om �ret �r j�mnt delbart med 4. Om �rtalet �r j�mt
  --|                  delbart med 100 �r det dock inget skott�r. Undantag fr�n
  --|                  detta �r om �rtalet �r j�mnt delbart med 400 vilket ger
  --|                  att det �r skott�r iallafall.
  --| Indata         : �rtalet.
  --| Returv�rde     : Sant om det var ett skott�r, annars falskt.
  --| F�ruts�ttningar: ---
  -----------------------------------------------------------------------------
  function Leap_Year(Year : in Integer) return Boolean is

  begin
    return ((Year mod 400 = 0) or else
            ((Year mod 4 = 0) and then
             (not (Year mod 100 = 0))));
  end Leap_Year;

  -----------------------------------------------------------------------------
  --| Modulnamn      : No_Of_Days
  --| Beskrivning    : Tar fram antalet dagar i en given m�nad ett givet �r.
  --| Indata         : �rtalet och m�naden.
  --| Returv�rde     : Antalet dagar i m�naden.
  --| F�ruts�ttningar: M�nadsnumret legalt.
  -----------------------------------------------------------------------------
  function No_Of_Days(Year, Month : in Integer) return Integer is

    type Days_In_Month_Type is
      array (1..12) of Integer;

    Days_In_Month : Days_In_Month_Type :=
      (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

  begin
    if Leap_Year(Year) then
      Days_In_Month(2) := 29;
    end if;
    return Days_In_Month(Month);
  end No_Of_Days;

  -----------------------------------------------------------------------------
  --| Modulnamn      : Get
  --| Beskrivning    : L�ser in ett datum fr�n tangentbordet.
  --| Indata         : ---
  --| Utdata         : Datumet.
  --| F�ruts�ttningar: Korrekt datum matas in av anv�ndaren.
  -----------------------------------------------------------------------------
  procedure Get(Item : out Date_Type) is

    Str : String(1..10);

  begin
    Get(Str);

    -- Check format ...
    for I in 1..10 loop
      case I is
         when 5 | 8 =>
           if Str(I) /= '-' then
             raise Format_Error;
           end if;
         when others =>
           if Str(I) not in '0'..'9' then
             raise Format_Error;
           end if;
      end case;
    end loop;

    -- Check year ...
    Item.Year := Integer'Value(Str(1..4));
    if Item.Year = 0 then
      raise Year_Error;
    end if;

    -- Check month ...
    Item.Month := Integer'Value(Str(6..7));
    if Item.Month not in 1..12 then
      raise Month_Error;
    end if;

    -- Check day ...
    Item.Day := Integer'Value(Str(9..10));
    if Item.Day not in  1..No_Of_Days(Item.Year, Item.Month) then
      raise Day_Error;
    end if;
  end Get;

  -----------------------------------------------------------------------------
  --| Modulnamn      : Put
  --| Beskrivning    : Skriver ut ett datum p� sk�rmen.
  --| Indata         : Datumet.
  --| Utdata         : ---
  --| F�ruts�ttningar: ---
  -----------------------------------------------------------------------------
  procedure Put(Item : in Date_Type) is

    procedure Put_Fill(Item  : in Integer;
                       Width : in Natural := 0) is

    begin
      if Width < 2 then
        Put(Item, Width => 0);
      else
        Put_Fill(Item / 10, Width => Width - 1);
        Put(Item mod 10, Width => 0);
      end if;
    end Put_Fill;

  begin
    Put_Fill(Item.Year, Width => 4);
    Put('-');
    Put_Fill(Item.Month, Width => 2);
    Put('-');
    Put_Fill(Item.Day, Width => 2);
  end Put;

  -----------------------------------------------------------------------------
  --| Modulnamn      : Next_Date, Previous_Date
  --| Beskrivning    : Tar fram n�stf�ljande/f�reg�ende datum givet ett datum.
  --| Indata         : Det givna datumet.
  --| Returv�rde     : N�stf�ljande/f�reg�ende datum.
  --| F�ruts�ttningar: Ursprungligt datum ett korrekt datum.
  -----------------------------------------------------------------------------
  function Next_Date(Item : in Date_Type) return Date_Type is

    New_Item : Date_Type := Item;

  begin
    if New_Item.Day < No_Of_Days(New_Item.Year, New_Item.Month) then
      New_Item.Day := New_Item.Day + 1;
    else
      New_Item.Day := 1;
      if New_Item.Month < 12 then
        New_Item.Month := New_Item.Month + 1;
      else
        New_Item.Month := 1;
        New_Item.Year := New_Item.Year + 1;
        if New_Item.Year > 9999 then
          raise Year_Error;
        end if;
      end if;
    end if;
    return New_Item;
  end Next_Date;
  -----------------------------------------------------------------------------
  function Previous_Date(Item : in Date_Type) return Date_Type is

    New_Item : Date_Type := Item;

  begin
    New_Item.Day := New_Item.Day - 1;
    if New_Item.Day = 0 then
      New_Item.Month := New_Item.Month - 1;
      if New_Item.Month = 0 then
        New_Item.Month := 12;
        New_Item.Year := New_Item.Year - 1;
        if New_Item.Year < 1 then
          raise Year_Error;
        end if;
      end if;
      New_Item.Day := No_Of_Days(New_Item.Year, New_Item.Month);
    end if;
    return New_Item;
  end Previous_Date;

  -----------------------------------------------------------------------------
  --| Modulnamn      : To_Integer
  --| Beskrivning    : Konverterar ett datum till ett heltal.
  --| Indata         : Ett datum.
  --| Returv�rde     : Ett motsvarande heltal.
  --| F�ruts�ttningar: ---
  -----------------------------------------------------------------------------
  function To_Integer(Item : in Date_Type) return Integer is

  begin
    return Item.Year * 10000 + Item.Month * 100 + Item.Day;
  end To_Integer;

  -----------------------------------------------------------------------------
  --| Modulnamn      : "=", "<", ">", "<=", ">="
  --| Beskrivning    : J�mf�r tv� datum och ser om villkoret st�mmer.
  --| Indata         : Tv� datum.
  --| Returv�rde     : Sant om villkoret �r uppfyllt, annars falskt.
  --| F�ruts�ttningar: Korrekta datum att j�mf�ra.
  -----------------------------------------------------------------------------
  function "="(Left, Right : in Date_Type) return Boolean is

  begin
    return To_Integer(Left) = To_Integer(Right);
  end "=";
  -----------------------------------------------------------------------------
  function "<"(Left, Right : in Date_Type) return Boolean is

  begin
    return To_Integer(Left) < To_Integer(Right);
  end "<";
  -----------------------------------------------------------------------------
  function ">"(Left, Right : in Date_Type) return Boolean is

  begin
    return (Right < Left);
  end ">";
  -----------------------------------------------------------------------------
  function "<="(Left, Right : in Date_Type) return Boolean is

  begin
    return not (Right < Left);
  end "<=";
  -----------------------------------------------------------------------------
  function ">="(Left, Right : in Date_Type) return Boolean is

  begin
    return not (Left < Right);
  end ">=";

end Date_Handling;
